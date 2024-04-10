import request from '@/utils/request';
import { AxiosPromise } from 'axios';
import { CaserecordsVO, CaserecordsForm, CaserecordsQuery } from '@/api/system/caserecords/types';

/**
 * 查询病例信息列表
 * @param query
 * @returns {*}
 */

export const listCaserecords = (query?: CaserecordsQuery): AxiosPromise<CaserecordsVO[]> => {
  return request({
    url: '/system/caserecords/list',
    method: 'get',
    params: query
  });
};

/**
 * 查询病例信息详细
 * @param caseId
 */
export const getCaserecords = (caseId: string | number): AxiosPromise<CaserecordsVO> => {
  return request({
    url: '/system/caserecords/' + caseId,
    method: 'get'
  });
};

/**
 * 新增病例信息
 * @param data
 */
export const addCaserecords = (data: CaserecordsForm) => {
  return request({
    url: '/system/caserecords',
    method: 'post',
    data: data
  });
};

/**
 * 修改病例信息
 * @param data
 */
export const updateCaserecords = (data: CaserecordsForm) => {
  return request({
    url: '/system/caserecords',
    method: 'put',
    data: data
  });
};

/**
 * 删除病例信息
 * @param caseId
 */
export const delCaserecords = (caseId: string | number | Array<string | number>) => {
  return request({
    url: '/system/caserecords/' + caseId,
    method: 'delete'
  });
};
