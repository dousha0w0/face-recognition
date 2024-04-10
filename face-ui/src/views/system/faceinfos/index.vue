<template>
  <div class="p-2">
    <transition :enter-active-class="proxy?.animate.searchAnimate.enter" :leave-active-class="proxy?.animate.searchAnimate.leave">
      <div class="search" v-show="showSearch">
        <el-form :model="queryParams" ref="queryFormRef" :inline="true" label-width="68px">
          <el-form-item label="用户ID" prop="userId">
            <el-input v-model="queryParams.userId" placeholder="请输入用户ID" clearable style="width: 240px" @keyup.enter="handleQuery" />
          </el-form-item>
          <el-form-item label="人脸数据" prop="faceData">
            <el-input v-model="queryParams.faceData" placeholder="请输入人脸数据" clearable style="width: 240px" @keyup.enter="handleQuery" />
          </el-form-item>
          <el-form-item label="录入时间" prop="timestamp">
            <el-date-picker clearable
                            v-model="queryParams.timestamp"
                            type="date"
                            value-format="YYYY-MM-DD"
                            placeholder="请选择人脸数据录入时间"
            />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
            <el-button icon="Refresh" @click="resetQuery">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
    </transition>

    <el-card shadow="never">
      <template #header>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['system:faceinfos:add']">新增</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate()" v-hasPermi="['system:faceinfos:edit']">修改</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete()" v-hasPermi="['system:faceinfos:remove']">删除</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="warning" plain icon="Download" @click="handleExport" v-hasPermi="['system:faceinfos:export']">导出</el-button>
          </el-col>
          <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>
      </template>

      <el-table v-loading="loading" :data="faceinfosList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="人脸ID" align="center" prop="faceId" v-if="true" />
        <el-table-column label="用户ID" align="center" prop="userId" />
        <el-table-column label="人脸数据" align="center" prop="faceData" />
        <el-table-column label="人脸数据录入时间戳" align="center" prop="timestamp" width="180">
          <template #default="scope">
            <span>{{ parseTime(scope.row.timestamp, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template #default="scope">
            <el-tooltip content="修改" placement="top">
              <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:faceinfos:edit']"></el-button>
            </el-tooltip>
            <el-tooltip content="删除" placement="top">
              <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['system:faceinfos:remove']"></el-button>
            </el-tooltip>
          </template>
        </el-table-column>
      </el-table>

      <pagination
        v-show="total>0"
        :total="total"
        v-model:page="queryParams.pageNum"
        v-model:limit="queryParams.pageSize"
        @pagination="getList"
      />
    </el-card>
    <!-- 添加或修改人脸信息对话框 -->
    <el-dialog :title="dialog.title" v-model="dialog.visible" width="500px" append-to-body>
      <el-form ref="faceinfosFormRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户ID" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户ID" />
        </el-form-item>
        <el-form-item label="人脸数据" prop="faceData">
          <el-input v-model="form.faceData" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="人脸数据录入时间戳" prop="timestamp">
          <el-date-picker clearable
                          v-model="form.timestamp"
                          type="datetime"
                          value-format="YYYY-MM-DD HH:mm:ss"
                          placeholder="请选择人脸数据录入时间戳">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button :loading="buttonLoading" type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Faceinfos" lang="ts">
import { listFaceinfos, getFaceinfos, delFaceinfos, addFaceinfos, updateFaceinfos } from '@/api/system/faceinfos';
import { FaceinfosVO, FaceinfosQuery, FaceinfosForm } from '@/api/system/faceinfos/types';

const { proxy } = getCurrentInstance() as ComponentInternalInstance;

const faceinfosList = ref<FaceinfosVO[]>([]);
const buttonLoading = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref<Array<string | number>>([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);

const queryFormRef = ref<ElFormInstance>();
const faceinfosFormRef = ref<ElFormInstance>();

const dialog = reactive<DialogOption>({
  visible: false,
  title: ''
});

const initFormData: FaceinfosForm = {
  faceId: undefined,
  userId: undefined,
  faceData: undefined,
  timestamp: undefined
}
const data = reactive<PageData<FaceinfosForm, FaceinfosQuery>>({
  form: {...initFormData},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    userId: undefined,
    faceData: undefined,
    timestamp: undefined,
    params: {
    }
  },
  rules: {
    faceId: [
      { required: true, message: "人脸ID不能为空", trigger: "blur" }
    ],
    userId: [
      { required: true, message: "用户ID不能为空", trigger: "blur" }
    ],
    faceData: [
      { required: true, message: "人脸数据不能为空", trigger: "blur" }
    ],
    timestamp: [
      { required: true, message: "人脸数据录入时间戳不能为空", trigger: "blur" }
    ]
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询人脸信息列表 */
const getList = async () => {
  loading.value = true;
  const res = await listFaceinfos(queryParams.value);
  faceinfosList.value = res.rows;
  total.value = res.total;
  loading.value = false;
}

/** 取消按钮 */
const cancel = () => {
  reset();
  dialog.visible = false;
}

/** 表单重置 */
const reset = () => {
  form.value = {...initFormData};
  faceinfosFormRef.value?.resetFields();
}

/** 搜索按钮操作 */
const handleQuery = () => {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
const resetQuery = () => {
  queryFormRef.value?.resetFields();
  handleQuery();
}

/** 多选框选中数据 */
const handleSelectionChange = (selection: FaceinfosVO[]) => {
  ids.value = selection.map(item => item.faceId);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
const handleAdd = () => {
  reset();
  dialog.visible = true;
  dialog.title = "添加人脸信息";
}

/** 修改按钮操作 */
const handleUpdate = async (row?: FaceinfosVO) => {
  reset();
  const _faceId = row?.faceId || ids.value[0]
  const res = await getFaceinfos(_faceId);
  Object.assign(form.value, res.data);
  dialog.visible = true;
  dialog.title = "修改人脸信息";
}

/** 提交按钮 */
const submitForm = () => {
  faceinfosFormRef.value?.validate(async (valid: boolean) => {
    if (valid) {
      buttonLoading.value = true;
      if (form.value.faceId) {
        await updateFaceinfos(form.value).finally(() =>  buttonLoading.value = false);
      } else {
        await addFaceinfos(form.value).finally(() =>  buttonLoading.value = false);
      }
      proxy?.$modal.msgSuccess("修改成功");
      dialog.visible = false;
      await getList();
    }
  });
}

/** 删除按钮操作 */
const handleDelete = async (row?: FaceinfosVO) => {
  const _faceIds = row?.faceId || ids.value;
  await proxy?.$modal.confirm('是否确认删除人脸信息编号为"' + _faceIds + '"的数据项？').finally(() => loading.value = false);
  await delFaceinfos(_faceIds);
  proxy?.$modal.msgSuccess("删除成功");
  await getList();
}

/** 导出按钮操作 */
const handleExport = () => {
  proxy?.download('system/faceinfos/export', {
    ...queryParams.value
  }, `faceinfos_${new Date().getTime()}.xlsx`)
}

onMounted(() => {
  getList();
});
</script>
