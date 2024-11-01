<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 13/09/2024
  Time: 8:01 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingAPI" value="/api/building"/>
<c:url var="buildingListURL" value="/admin/building-list"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
</head>
<body>

    <div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->


        </div>

        <div class="page-content">
            <div class="page-header" >
                <h1 style="font-family: 'Times New Roman', Times, serif;">
                    Danh sách tìm kiếm
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <div class = "row">
                <div class="col-xs-12 ">
                    <div class="widget-box ui-sortable-handle">
                        <div class="widget-header">
                            <h5 class="widget-title">Tìm kiếm</h5>

                            <div class="widget-toolbar">


                                <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>

                        <div class="widget-body" style ="font-family:'Times New Roman', Times, serif ;">
                            <div class="widget-main" >
                                <form:form id="listForm" modelAttribute ="modelSearch" action = "${buildingListURL}" method="GET">
                                    <div class="row">
                                        <div class = "form-group">
                                            <div class="col-xs-12">

                                                <div class="col-xs-6">

                                                        <label class="name">Tên tòa nhà </label>
<%--                                                        <input type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                         <form:input class="form-control" path="name"/>
                                                </div>

                                                <div class="col-xs-6">

                                                        <label class="name">Diện tich sàn </label>
<%--                                                        <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                                                        <form:input class="form-control" path="floorArea"/>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-2">

                                                        <label class="name">Quận </label>
<%--                                                        <select class="form-control" name="district" >--%>
<%--                                                            <option value="">--- Chọn Quận ---</option>--%>
<%--                                                            <option value="QUAN_1">Quận 1</option>--%>
<%--                                                            <option value="QUAN_2">Quận 2</option>--%>
<%--                                                            <option value="QUAN_3">Quận 3</option>--%>
<%--                                                            <option value="QUAN_10">Quận 10</option>--%>
<%--                                                        </select>--%>
                                                        <form:select class="form-control" path="district" >
                                                            <form:option value="">--- Chọn Quận ---</form:option>
                                                            <form:options items="${districts}"></form:options>
                                                        </form:select>


                                                </div>
                                                <div class="col-xs-5">

                                                        <label class="name">Phường</label>
                                                        <form:input class="form-control" path="ward"/>

                                                </div>
                                                <div class="col-xs-5">

                                                        <label class="name">Đường </label>
                                                        <form:input class="form-control" path="street"/>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">

                                                <div class="col-xs-4">
                                                    <label class="name">Số tầng hầm </label>
                                                    <form:input class="form-control" path="numberOfBasement"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Hướng </label>
                                                    <form:input class="form-control" path="direction"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Hạng </label>
                                                    <form:input  class="form-control" path="level" value=""/>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">

                                                <div class="col-xs-3">
                                                    <label class="name">Diện tích từ </label>
                                                    <form:input class="form-control" path="areaFrom"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Diện tích đến </label>
                                                    <form:input class="form-control" path="areaTo"/>

                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Giá thuê từ</label>
                                                    <form:input class="form-control" path="rentPriceFrom"/>

                                                </div>
                                                <div class="col-xs-3">
                                                    <form:input class="form-control" path="rentPriceTo"/>

                                                </div>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">

                                                <div class="col-xs-5">
                                                    <label class="name">Tên quản lý </label>
                                                    <form:input class="form-control" path="managerName"/>

                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">Số điện thoại quản lý </label>
                                                    <form:input class="form-control" path="managerPhone"/>

                                                </div>
                                                <div class="col-xs-2">
                                                    <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                                        <label class="name">Nhân viên phụ trách </label>
                                                        <form:select class="form-control" path="staffId">
                                                            <form:option value="">--- Chọn nhân viên ---</form:option>
                                                            <form:options items="${listStaff}"/>
                                                        </form:select>
                                                    </security:authorize>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
<%--                                                    <label class="checkbox-inline">--%>
<%--                                                        <input name="typeCode" type="checkbox" value="noi-that"> Nội thất--%>
<%--                                                    </label>--%>
<%--                                                    <label class="checkbox-inline">--%>
<%--                                                        <input name="typeCode" type="checkbox" value="tang-tret"> Tầng trệt--%>
<%--                                                    </label>--%>
<%--                                                    <label class="checkbox-inline">--%>
<%--                                                        <input name="typeCode" type="checkbox" value="nguyen-can"> Nguyên căn--%>
<%--                                                    </label>--%>
                                                    <form:checkboxes class="checkbox-inline" items="${typeCodes}" path="typeCode"></form:checkboxes>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <button class="btn btn-primary" id="btnSearchBuilding">
                                                        <i class="ace-icon fa fa-flask align-top bigger-125"></i>
                                                        Tìm kiếm
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                        <div class="pull-right">
                            <security:authorize access="hasAnyRole('MANAGER','ADMIN')">
                                <a href="/admin/building-edit">
                                    <button class="btn btn-success" title="Thêm tòa nhà" >
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </a>

                                <button class="btn btn-danger" title="Xóa tòa nhà" id="btnDeleteBuildings">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </security:authorize>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bảng danh sách -->
            <div class="row">
                <div class="col-xs-12" >
<%--                    <table id="tableList" style="margin: 3em 0 1.5em " id="simple-table" class="table table-striped table-bordered table-hover">--%>
<%--                        <thead style="font-family: 'Times New Roman', Times, serif;">--%>
<%--                        <tr>--%>
<%--                             <security:authorize access="hasAnyRole('MANAGER','ADMIN')">--%>
<%--                                <th class="center">--%>
<%--                                    <label class="pos-rel">--%>
<%--                                        <input type="checkbox" name="checkList" value="" class="ace">--%>
<%--                                        <span class="lbl"></span>--%>
<%--                                    </label>--%>
<%--                                </th>--%>
<%--                             </security:authorize>--%>
<%--                                <th>Tên tòa nhà</th>--%>
<%--                                <th>Địa chỉ</th>--%>
<%--                                <th>Số tầng hầm</th>--%>
<%--                                <th>Tên quản lý</th>--%>
<%--                                <th>SĐT quản lý</th>--%>
<%--                                <th>DT sàn</th>--%>
<%--                                <th>DT trống</th>--%>
<%--                                <th>Diện tích thuê</th>--%>
<%--                                <th>Phí MG</th>--%>
<%--                                <th>Thao tác</th>--%>

<%--                        </tr>--%>
<%--                        </thead>--%>

<%--                        <tbody>--%>
<%--                         <c:forEach var="item" items="${buildingList}">--%>
<%--                            <tr>--%>
<%--                               <security:authorize access="hasAnyRole('MANAGER','ADMIN')">--%>
<%--                                 <td class="center">--%>
<%--                                    <label class="pos-rel">--%>
<%--                                        <input type="checkbox" class="ace" name="checkList" value="${item.id}" >--%>
<%--                                        <span class="lbl"></span>--%>
<%--                                    </label>--%>
<%--                                </td>--%>
<%--                               </security:authorize>--%>

<%--                                <td>${item.name}</td>--%>
<%--                                <td>${item.address}</td>--%>
<%--                                <td>${item.numberOfBasement}</td>--%>
<%--                                <td>${item.managerName}</td>--%>
<%--                                <td>${item.managerPhoneNumber}</td>--%>
<%--                                <td>${item.floorArea}</td>--%>
<%--                                <td></td>--%>
<%--                                <td>${item.rentArea}</td>--%>
<%--                                <td>${item.brokerageFee}</td>--%>


<%--                                <td>--%>
<%--                                    <div class="hidden-sm hidden-xs btn-group">--%>
<%--                                        <security:authorize access="hasAnyRole('ADMIN','MANAGER')">--%>
<%--                                            <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">--%>
<%--                                                <i class="ace-icon fa fa-check bigger-120"></i>--%>
<%--                                            </button>--%>
<%--                                        </security:authorize>--%>
<%--                                        <security:authorize access="hasAnyRole('ADMIN','MANAGER','STAFF')">--%>
<%--                                            <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${item.id}">--%>
<%--                                                <i class="ace-icon fa fa-pencil bigger-120"></i>--%>
<%--                                            </a>--%>
<%--                                        </security:authorize>--%>
<%--                                        <security:authorize access="hasAnyRole('ADMIN','MANAGER')">--%>
<%--                                            <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})">--%>
<%--                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>--%>
<%--                                            </button>--%>
<%--                                        </security:authorize>--%>

<%--                                    </div>--%>

<%--                                </td>--%>
<%--                        </tr>--%>
<%--                        </c:forEach>--%>


<%--                        </tbody>--%>
<%--                    </table>--%>



                    <div class="table-responsive">
                                    <display:table name="building.listResult" cellspacing="0" cellpadding="0"
                                                   requestURI="/admin/building-list" partialList="true" sort="external"
                                                   size="${building.totalItems}" defaultsort="2" defaultorder="ascending"
                                                   id="tableList" pagesize="${building.maxPageItems}"
                                                   export="false"
                                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                                   style="margin: 3em 0 1.5em;">
                                        <security:authorize access="hasAnyRole('MANAGER','ADMIN')">
                                        <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                                        headerClass="center select-cell">
                                            <fieldset>
                                                <input type="checkbox" name="checkList" value="${tableList.id}"
                                                       id="checkbox_${tableList.id}" class="check-box-element"/>
                                            </fieldset>
                                        </display:column>
                                        </security:authorize>
                                        <display:column headerClass="text-left" property="name" title="Tên tòa nhà"/>
                                        <display:column headerClass="text-left" property="address" title="Địa chỉ"/>
                                         <display:column headerClass="text-left" property="numberOfBasement" title="Số tầng hầm"/>
                                        <display:column headerClass="text-left" property="managerName" title="Tên quản lý"/>
                                         <display:column headerClass="text-left" property="managerPhoneNumber" title="SĐT quản lý"/>
                                        <display:column headerClass="text-left" property="floorArea" title="DT sàn"/>
                                         <display:column headerClass="text-left" property="rentArea" title="Diện tích thuê"/>
                                        <display:column headerClass="text-left" property="brokerageFee" title="Phí MG"/>
                                        <display:column headerClass="col-actions" title="Thao tác">
<%--                                            <c:if test="${tableList.roleCode != 'MANAGER'}">--%>
<%--                                                <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"--%>
<%--                                                   title="Cập nhật người dùng"--%>
<%--                                                   href='<c:url value="/admin/user-edit-${tableList.id}"/>'>--%>
<%--                                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>--%>
<%--                                                </a>--%>
<%--                                            </c:if>--%>
<%--                                            <c:if test="${tableList.roleCode == 'MANAGER'}">--%>
<%--                                                <p>Không đươc thao tác</p>--%>
<%--                                            </c:if>--%>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                                        <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${tableList.id})">
                                                            <i class="ace-icon fa fa-check bigger-120"></i>
                                                        </button>
                                                    </security:authorize>
                                                    <security:authorize access="hasAnyRole('ADMIN','MANAGER','STAFF')">
                                                        <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${tableList.id}">
                                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                        </a>
                                                    </security:authorize>
                                                    <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                                        <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${tableList.id})">
                                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                        </button>
                                                    </security:authorize>

                                                </div>
                                        </display:column>
                                    </display:table>
                    </div>
                </div><!-- /.span -->
            </div>

        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<div class="modal fade" id="assignmentBuildingModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table style="margin: 3em 0 1.5em " id="staffList" class="table table-striped table-bordered table-hover" >
                    <thead style="font-family: 'Times New Roman', Times, serif;">
                    <tr>

                        <th>Chọn</th>
                        <th>Tên nhân viên</th>

                    </tr>
                    </thead>

                    <tbody>


                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="building" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssignmentBuilding" data-dismiss="modal">Giao tòa nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>

    <script>
        function assignmentBuilding(buildingId){
            $('#assignmentBuildingModal').modal();
            loadStaff(buildingId)
            $('#buildingId').val(buildingId);

        }

        function loadStaff(buildingId){
            $.ajax({
                type: "GET",
                url: "${buildingAPI}/"+buildingId+"/staffs",
                data: JSON.stringify(buildingId),
                contentType: "application/json",
                dataType:"JSON",
                success: function(response){
                  var row='';
                  $.each(response.data, function (index,item){
                        row+= ' <tr>';
                        row+= ' <td className="center"><input type="checkbox" value= '+item.staffId +' id="checkbox_'+ item.staffId+'" '+item.checked+'/></td>';
                        row += '<td > '+item.fullName + '</td>';
                        row+='</tr> ';
                  });
                  $('#staffList tbody').html(row);
                },
                error: function(response){
                  console.log(response);
                }
              })
        }

        $('#btnAssignmentBuilding').click(function(e){
            e.preventDefault();
            var data ={};
            data['buildingId'] =$('#buildingId').val();
            var staffs =$('#staffList').find('tbody input[type=checkbox]:checked').map(function(){
                return $(this).val();
            }).get();
            data['staffs']= staffs;
             assignment(data);

        });

        function assignment(data){
            $.ajax({
                type: "POST",
                url: "${buildingAPI}"+"/assignment",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType:"JSON",
                success: function(response){
                    console.log(response);
                },
                error: function(response){
                  console.log(response);
                }
              })
        }

        $('#btnSearchBuilding').click(function(e){
            e.preventDefault();
            $('#listForm').submit();
        });
        function  deleteBuilding(data){
            var buildingId=[data]
            deleteBuildings(buildingId);
        }
        $('#btnDeleteBuildings').click(function(e){
            e.preventDefault();
            // var buildingIds =$('#tableList').find('tbody input[type=checkbox]:checked').map(function(){
            //     return $(this).val();
            // }).get();
            var buildingIds = $('#tableList').find('input[type=checkbox]:checked').not('#checkAll').map(function() {
                return $(this).val();
            }).get();
            deleteBuildings(buildingIds);
        });

        function  deleteBuildings(data){
            $.ajax({
                type: "DELETE",
                url: "${buildingAPI}/"+data,
                data: JSON.stringify(data),
                contentType: "application/json",
                // dataType:"JSON",
                success: function(response){
                  console.log(response);
                  window.location.href="/admin/building-list";
                },
                error: function(response){
                  console.log(response);
                  location.reload();
                }
            });
        };


    </script>
</body>
</html>
