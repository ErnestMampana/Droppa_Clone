class BaseApiResponse {
  final bool? success;
  BaseApiResponse(this.success);
}

//When status code is 200
class ApiResponse extends BaseApiResponse {
  final dynamic data;
  final ApiResponseMetadata? metadata;
  ApiResponse(success, this.data, this.metadata) : super(success);

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    ApiResponseMetadata? metaData;
    var metaDataJson = json["metadata"];
    if (json != null) {
      metaData = ApiResponseMetadata.fromJson(json["metadata"]);
    }
    return ApiResponse(json["success"], json["data"], metaData);
  }
}

class ApiErrorResponse extends BaseApiResponse {
  final ApiResponseMetadata? metadata;
  final ApiResponseErrorModel? error;

  ApiErrorResponse(success, this.metadata, this.error) : super(success);

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    ApiResponseMetadata? metaData;
    var metaDataJson = json["MetaData"];
    if (metaDataJson != null) {
      metaData = ApiResponseMetadata.fromJson(metaDataJson);
    }

    ApiResponseErrorModel? errorResponse;
    var errorJson = json["Error"];
    if (errorJson != null) {
      errorResponse = ApiResponseErrorModel.fromJson(errorJson);
    }
    return ApiErrorResponse(json["Success"], metaData, errorResponse);
  }
}

class ApiResponseErrorModel {
  // final int? code;
  final String? message;
  // final dynamic erroData;

  ApiResponseErrorModel( this.message);
  factory ApiResponseErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseErrorModel(
        json["Message"]);
  }
}

class ApiResponseMetadata {
  final int? totalRecords;
  final ApiResponseMetadataPagingModel? paging;
  final ApiResponseNewRecordMetadataModel? newRecord;

  ApiResponseMetadata(this.totalRecords, this.paging, this.newRecord);
  factory ApiResponseMetadata.fromJson(Map<String, dynamic> json) {
    ApiResponseMetadataPagingModel? paging;
    var pagingJson = json["PageSize"];
    var vari = json;

    if (pagingJson != null) {
      paging = ApiResponseMetadataPagingModel.fromJson(pagingJson);
    }

    var newRecordJson = json["NewRecord"];
    ApiResponseNewRecordMetadataModel? newRecord;
    if (newRecordJson != null) {
      newRecord = ApiResponseNewRecordMetadataModel.fromJson(newRecordJson);
    }
    return ApiResponseMetadata(json["TotalRecords"], paging, newRecord);
  }
}

class ApiResponseMetadataPagingModel {
  final int? pageSize;
  final int? pageNo;
  final int? totalPages;
  final String? pageTag;

  ApiResponseMetadataPagingModel(
      this.pageSize, this.pageNo, this.totalPages, this.pageTag);

  factory ApiResponseMetadataPagingModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseMetadataPagingModel(
        json["PageSize"], json["pageNo"], json["totalPages"], json["pageTag"]);
  }
}

class ApiResponseNewRecordMetadataModel {
  final String? location;
  final int? id;
  final dynamic key;

  ApiResponseNewRecordMetadataModel(this.location, this.id, this.key);
  factory ApiResponseNewRecordMetadataModel.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseNewRecordMetadataModel(
        json["Location"], json["Id"], json["Key"]);
  }
}
