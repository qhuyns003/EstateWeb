<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 18/10/2024
  Time: 7:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="customerAPI" value="/api/customer"/>
<c:url var="transactionAPI" value="/api/transaction"/>
<html>
<head>
    <title>Thông tin khách hàng</title>
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
        <div class="page-header">
          <h1 >
            Thông tin khách hàng
            <small>
              <i class="ace-icon fa fa-angle-double-right"></i>
              overview &amp; stats
            </small>
          </h1>
        </div><!-- /.page-header -->

        <!-- Bảng danh sách -->
        <div class="row" style = "font-family: 'Times New Roman', Times, serif;">
          <form:form modelAttribute="customerEdit" id="listForm" action = "${customerAPI}" method="POST">
              <form class="form-horizontal" role="form" >

                <div class="form-group">
                  <label class="col-xs-3">Tên khách hàng </label>
                  <div class="col-xs-9">
                    <form:input class="form-control" path="fullName" />
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-xs-3">Số điện thoại </label>
                  <div class="col-xs-9">
                    <form:input class="form-control" path="phone" />

                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3"> Email </label>
                  <div class="col-xs-9">
                    <form:input class="form-control" path="email" />

                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Tên công ty</label>
                  <div class="col-xs-9">
                    <form:input class="form-control" path="companyName" />

                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Nhu cầu</label>
                  <div class="col-xs-9">
                    <form:input class="form-control" path="demand" />

                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Tình trạng </label>
                  <div class="col-xs-2">
<%--                    <form:input class="form-control" path="status" />--%>
                     <form:select class="form-control" path="status" >
                         <form:option value="">--- Chọn ---</form:option>
                         <form:options items="${status}"></form:options>
                     </form:select>
                  </div>
                </div>


                <div class="form-group">
                  <label class="col-xs-3"> </label>
                  <div class="col-xs-9">
                    <c:if test="${not empty customerEdit.id}">
                        <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                          <button class="btn btn-primary" id="btnAddOrUpdateCustomer">Cập nhật thông tin</button>
                        </security:authorize>
                          <button class="btn btn-primary" id="btnCancel">Hủy thao tác</button>

                    </c:if>
                    <c:if test="${empty customerEdit.id}">
                      <button class="btn btn-primary" id="btnAddOrUpdateCustomer">Thêm khách hàng</button>
                      <button class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                    </c:if>

                  </div>
                </div>
                <form:hidden path="id" id="buildingId"></form:hidden>
                <form:hidden path="isActive" ></form:hidden>
              </form>
          </form:form>
        </div>

        <div>


          <c:if test="${ not empty customerEdit.id}">
               <c:forEach var="item" items="${transactionType}">
                  <div class="col-xs-12">
                    <h3 class="header smaller lighter blue">${item.value}</h3>
                  </div>
                  <div class="col-xs-12">
                    <button class="btn btn-primary" title="Thêm giao dịch" onclick="addTransaction('${item.key}',${customerEdit.id})">Add</button>
                  </div>
                  <div class="col-xs-12">

                    <table id="tableList" style="margin: 3em 0 1.5em " id="simple-table" class="table table-striped table-bordered table-hover">

                        <thead style="font-family: 'Times New Roman', Times, serif;">
                        <tr>

                                <th>Ngày tạo</th>
                                <th>Người tạo</th>
                                <th>Ngày sửa</th>
                                <th>Người sửa</th>
                                <th>Chi tiết giao dịch</th>
                                <th>Thao tác</th>

                        </tr>
                        </thead>

                        <tbody>
                            <c:if test="${item.key == 'DDX'}">
                                <c:forEach var="item2" items="${ddx}">
                                    <tr>

                                        <td>${item2.createdDate}</td>
                                        <td>${item2.createdBy}</td>
                                        <td>${item2.modifiedDate}</td>
                                        <td>${item2.modifiedBy}</td>

                                        <td>${item2.note}</td>

                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">

                                                <security:authorize access="hasAnyRole('ADMIN','MANAGER','STAFF')">
                                                    <a class="btn btn-xs btn-info" title="Sửa giao dịch" onclick="updateTransaction(${item2.id})">
                                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                    </a>
                                                </security:authorize>
                                                <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                                    <button class="btn btn-xs btn-danger" title="Xóa giao dịch" onclick="deleteTransaction(${item2.id})" >
                                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                    </button>
                                                </security:authorize>

                                            </div>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${item.key == 'CSKH'}">
                                <c:forEach var="item2" items="${cskh}">
                                    <tr>

                                        <td>${item2.createdDate}</td>
                                        <td>${item2.createdBy}</td>
                                        <td>${item2.modifiedDate}</td>
                                        <td>${item2.modifiedBy}</td>
                                        <td>${item2.note}</td>

                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">

                                                <security:authorize access="hasAnyRole('ADMIN','MANAGER','STAFF')">
                                                    <a class="btn btn-xs btn-info" title="Sửa giao dịch" onclick="updateTransaction(${item2.id})">
                                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                    </a>
                                                </security:authorize>
                                               <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                                                    <button class="btn btn-xs btn-danger" title="Xóa giao dịch" onclick="deleteTransaction(${item2.id})" >
                                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                    </button>
                                                </security:authorize>

                                            </div>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>



                        </tbody>
                    </table>

                  </div>


               </c:forEach>
          </c:if>
        </div>

      </div><!-- /.page-content -->
    </div>
  </div><!-- /.main-content -->
<div class="modal fade" id="noteTransactionModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Nhập giao dịch</h4>
            </div>
            <div class="modal-body">
                <table style="margin: 3em 0 1.5em " id="noteTransaction" class="table table-striped table-bordered table-hover" >
                    <thead style="font-family: 'Times New Roman', Times, serif;">
                    <tr>



                    </tr>
                    </thead>

                    <tbody>


                    </tbody>
                </table>
                <input type="hidden" id="transactionId" name="transaction" value="">
                <input type="hidden" id="code" name="code" value="">
                <input type="hidden" id="customerId" name="customerId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAddOrUpdateTransaction" data-dismiss="modal">Xác nhận</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
  <script>
  function deleteTransaction(transId){
    $.ajax({
                type: "DELETE",
                url: "${transactionAPI}/"+transId,
                data: JSON.stringify(),
                contentType: "application/json",
                // dataType:"JSON",
                success: function(response){
                  console.log(response);
                  location.reload();
                },
                error: function(response){

                  console.log(response);
                  location.reload();
                }
              })
  }
  $('#btnAddOrUpdateTransaction').click(function(e){
      e.preventDefault();
      var data ={};
      data['transactionId'] =$('#transactionId').val();
      data['note']= $('#note').val();
      data['code']= $('#code').val();
      data['customerId']= $('#customerId').val();
      if(data['transactionId']==""){
        data['transactionId'] =null;
      };
      if(data['note']==""){
        data['note'] =null;
      };
      if(data['code']==""){
        data['code'] =null;
      };
      if(data['customerId']==""){
        data['customerId'] =null;
      };
      addOrUpdate(data);

  });
  function addOrUpdate(data){
      $.ajax({
                type: "POST",
                url: "${transactionAPI}",
                data: JSON.stringify(data),
                contentType: "application/json",
                // dataType:"JSON",
                success: function(response){
                    location.reload()
                },
                error: function(res){
                    location.reload()
                }
              })
  }
  function updateTransaction(transactionId){
            $('#noteTransactionModal').modal();
            loadNote(transactionId)
            $('#transactionId').val(transactionId);

        }
  function addTransaction(transType,cusId){
            $('#noteTransactionModal').modal();
            var row='';
            row+= ' <tr>';
            row += '<td >Chi tiết giao dịch</td>';
            row+= ' <td className="center"><input  value=""  id="note" /></td>';
            row+='</tr> ';
            $('#noteTransaction tbody').html(row)
            $('#code').val(transType);
            $('#customerId').val(cusId);

        }
   function loadNote(transactionId){
            $.ajax({
                type: "GET",
                url: "${transactionAPI}/"+transactionId,
                data: JSON.stringify(transactionId),
                contentType: "application/json",
                dataType:"JSON",
                success: function(response){
                  var row='';
                  $.each(response.data, function (index,item){
                        row+= ' <tr>';
                        row += '<td >Chi tiết giao dịch</td>';
                        row+= ' <td className="center"><input  value="'+item.note+'"  id="note" /></td>';
                        row+='</tr> ';
                  });
                  $('#noteTransaction tbody').html(row);
                  row+="";
                },
                error: function(response){


                  console.log(response);
                }
              })
        }

  $('#btnCancel').click(function(e){
      e.preventDefault();
      window.location.href="/admin/customer-list";
  });

  $('#btnAddOrUpdateCustomer').click(function (e){
      e.preventDefault();
      // $('#listForm').submit();
      // tốt nhất nên gửi về controller cho lẹ.
      <%--window.location.href = "/admin/customer-edit-"+ "${customerEdit.id}" ;--%>
      $.ajax({
        type: $('#listForm').attr('method'), // Lấy phương thức (GET/POST) từ biểu mẫu
        url: $('#listForm').attr('action'), // Lấy URL hành động từ biểu mẫu
        data: $('#listForm').serialize(), // Chuyển đổi dữ liệu biểu mẫu thành chuỗi
        success: function (response) {
            // Chuyển hướng đến URL mới khi thành công

            alert("Thành công");
            window.location.href="/admin/customer-list"
        },
        error: function (res) {
            // Xử lý trường hợp lỗi
            if (res.status === 400) {
                    try {
                        const errorResponse = JSON.parse(res.responseText);
                        errorMessage = errorResponse.message;
                    } catch (e) {
                        // Nếu không thành công, sử dụng phản hồi văn bản thuần túy
                        errorMessage = res.responseText;
                    }

                    alert( errorMessage);
                }
        }
    });
  });

</script>
</body>
</html>