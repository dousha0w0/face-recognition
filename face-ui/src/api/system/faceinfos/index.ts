import request from '@/utils/request';
import { AxiosPromise } from 'axios';
import { FaceinfosVO, FaceinfosForm, FaceinfosQuery } from '@/api/system/faceinfos/types';

/**
 * 查询人脸信息列表
 * @param query
 * @returns {*}
 */

export const listFaceinfos = (query?: FaceinfosQuery): AxiosPromise<FaceinfosVO[]> => {
  return request({
    url: '/system/faceinfos/list',
    method: 'get',
    params: query
  });
};

/**
 * 查询人脸信息详细
 * @param faceId
 */
export const getFaceinfos = (faceId: string | number): AxiosPromise<FaceinfosVO> => {
  return request({
    url: '/system/faceinfos/' + faceId,
    method: 'get'
  });
};

/**
 * 新增人脸信息
 * @param data
 */
export const addFaceinfos = (data: FaceinfosForm) => {
  return request({
    url: '/system/faceinfos',
    method: 'post',
    data: data
  });
};

/**
 * 修改人脸信息
 * @param data
 */
export const updateFaceinfos = (data: FaceinfosForm) => {
  return request({
    url: '/system/faceinfos',
    method: 'put',
    data: data
  });
};

/**
 * 删除人脸信息
 * @param faceId
 */
export const delFaceinfos = (faceId: string | number | Array<string | number>) => {
  return request({
    url: '/system/faceinfos/' + faceId,
    method: 'delete'
  });
};
