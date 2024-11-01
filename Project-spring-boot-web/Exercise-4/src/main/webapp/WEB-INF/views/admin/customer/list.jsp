<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 16/10/2024
  Time: 10:31 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="customerAPI" value = "/api/customer" />
<c:url var="customerListURL" value="/admin/customer-list"/>
<html>
  <head>
    <title>Thêm khách hàng</title>
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
                                <form:form id="listForm" modelAttribute ="modelSearch" action = "${customerListURL}" method="GET">
                                    <div class="row">
                                        <div class = "form-group">
                                            <div class="col-xs-12">

                                                <div class="col-xs-4">

                                                        <label class="name">Tên khách hàng </label>
<%--                                                        <input type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                         <form:input class="form-control" path="name"/>
                                                </div>

                                                <div class="col-xs-4">

                                                        <label class="name">Di động </label>
<%--                                                        <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                                                        <form:input class="form-control" path="phoneNumber"/>
                                                </div>

                                                <div class="col-xs-4">

                                                        <label class="name">Email </label>
<%--                                                        <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}">--%>
                                                        <form:input class="form-control" path="email"/>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">

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
                                                    <button class="btn btn-primary" id="btnSearchCustomer">
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
                                <a href="/admin/customer-edit">
                                    <button class="btn btn-success" title="Thêm khách hàng" >
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </a>

                                <button class="btn btn-danger" title="Xóa khách hàng" id="btnDeleteCustomers">
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
<%--                                <th>Tên khách hàng</th>--%>
<%--                                <th>Di động</th>--%>
<%--                                <th>Email</th>--%>
<%--                                <th>Nhu cầu</th>--%>
<%--                                <th>Người thêm</th>--%>
<%--                                <th>Ngày thêm</th>--%>
<%--                                <th>Tình trạng</th>--%>
<%--                                <th>Thao tác</th>--%>


<%--                        </tr>--%>
<%--                        </thead>--%>

<%--                        <tbody>--%>
<%--                         <c:forEach var="item" items="${customerList}">--%>
<%--                            <tr>--%>
<%--                               <security:authorize access="hasAnyRole('MANAGER','ADMIN')">--%>
<%--                                 <td class="center">--%>
<%--                                    <label class="pos-rel">--%>
<%--                                        <input type="checkbox" class="ace" name="checkList" value="${item.id}" >--%>
<%--                                        <span class="lbl"></span>--%>
<%--                                    </label>--%>
<%--                                </td>--%>
<%--                               </security:authorize>--%>

<%--                                <td>${item.fullName}</td>--%>
<%--                                <td>${item.phone}</td>--%>
<%--                                <td>${item.email}</td>--%>
<%--                                <td>${item.demand}</td>--%>
<%--                                <td>${item.createdBy}</td>--%>
<%--                                <td>${item.createdDate}</td>--%>
<%--                                <td>${item.status}</td>--%>


<%--                                <td>--%>
<%--                                    <div class="hidden-sm hidden-xs btn-group">--%>
<%--                                        <security:authorize access="hasAnyRole('ADMIN','MANAGER')">--%>
<%--                                            <button class="btn btn-xs btn-success" title="Giao khách hàng" onclick="assignmentCustomer(${item.id})">--%>
<%--                                                <i class="ace-icon fa fa-check bigger-120"></i>--%>
<%--                                            </button>--%>
<%--                                        </security:authorize>--%>
<%--                                        <security:authorize access="hasAnyRole('ADMIN','MANAGER','STAFF')">--%>
<%--                                            <a class="btn btn-xs btn-info" title="Sửa thông tin" href="/admin/customer-edit-${item.id}">--%>
<%--                                                <i class="ace-icon fa fa-pencil bigger-120"></i>--%>
<%--                                            </a>--%>
<%--                                        </security:authorize>--%>
<%--                                        <security:authorize access="hasAnyRole('ADMIN','MANAGER')">--%>
<%--                                            <button class="btn btn-xs btn-danger" title="Xóa khách hàng" onclick="deleteCustomer(${item.id})">--%>
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
                                    <display:table name="customer.listResult" cellspacing="0" cellpadding="0"
                                                   requestURI="/admin/customer-list" partialList="true" sort="external"
                                                   size="${customer.totalItems}" defaultsort="2" defaultorder="ascending"
                                                   id="tableList" pagesize="${customer.maxPageItems}"
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
                                        <display:column headerClass="text-left" property="fullName" title="Tên khách hàng"/>
                                        <display:column headerClass="text-left" property="phone" title="Di động"/>
                                         <display:column headerClass="text-left" property="email" title="Email"/>
                                        <display:column headerClass="text-left" property="demand" title="Nhu cầu"/>
                                         <display:column headerClass="text-left" property="createdBy" title="Người thêm"/>
                                        <display:column headerClass="text-left" property="createdDate" title="Ngày thêm"/>
                                         <display:column headerClass="text-left" property="status" title="Tình trạng"/>
                                        <display:column headerClass="col-actions" title="Thao tác">
                                               <div class="hidden-sm hidden-xs btn-group">
                                                    <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                                        <button class="btn btn-xs btn-success" title="Giao khách hàng" onclick="assignmentCustomer(${tableList.id})">
                                                            <i class="ace-icon fa fa-check bigger-120"></i>
                                                        </button>
                                                    </security:authorize>
                                                    <security:authorize access="hasAnyRole('ADMIN','MANAGER','STAFF')">
                                                        <a class="btn btn-xs btn-info" title="Sửa thông tin" href="/admin/customer-edit-${tableList.id}">
                                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                        </a>
                                                    </security:authorize>
                                                    <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                                        <button class="btn btn-xs btn-danger" title="Xóa khách hàng" onclick="deleteCustomer(${tableList.id})">
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
<div class="modal fade" id="assignmentCustomerModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
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
                <input type="hidden" id="customerId"  value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssignmentCustomer" data-dismiss="modal">Giao khách hàng</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
    <script>
        $('#btnSearchCustomer').click(function(e){
            e.preventDefault();
            $('#listForm').submit();
        });
        function assignmentCustomer(customerId){
            $('#assignmentCustomerModal').modal();
            loadStaff(customerId);
            $('#customerId').val(customerId);

        }
        function loadStaff(customerId){
             $.ajax({
                type: "GET",
                url: "${customerAPI}/"+customerId+"/staffs",
                data: JSON.stringify(customerId),
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
        $('#btnAssignmentCustomer').click(function (e){
            e.preventDefault();
            var data ={};
            data['customerId'] =$('#customerId').val();
            var staffs =$('#staffList').find('tbody input[type=checkbox]:checked').map(function(){
                return $(this).val();
            }).get();
            data['staffs']= staffs;
             assignment(data);
        })
        function assignment(data){
            $.ajax({
                type: "POST",
                url: "${customerAPI}"+"/assignment",
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
        function  deleteCustomer(data){
            var cusId=[data]
            deleteCustomers(cusId);
        }
        $('#btnDeleteCustomers').click(function(e){
                    e.preventDefault();
                    var customerIds =$('#tableList').find('input[type=checkbox]:checked').not('#checkAll').map(function(){
                        return $(this).val();
                    }).get();
                    deleteCustomers(customerIds);
        });

        function  deleteCustomers(data){
                    $.ajax({
                        type: "DELETE",
                        url: "${customerAPI}/"+data,
                        data: JSON.stringify(data),
                        contentType: "application/json",
                        // dataType:"JSON",
                        success: function(response){
                          alert("Thành công")
                          window.location.href="/admin/customer-list";
                        },
                        error: function(response){
                          alert("Thất bại")
                          location.reload();
                        }
                    });
        };
    </script>
  </body>
</html>
