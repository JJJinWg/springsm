<script>
  let detail = {
    init:function() {
      $('#update_btn').click(() => {
        this.check();
      });
      $('#delete_btn').click(() => {
        let id = $('#id').val();
        let c = confirm("삭제하시겠습니까 ?");
        if (c == true) {
          location.href = '<c:url value="/car/deleteimpl"/>' + '?id=' + id;
        }

      });
    },
    check: function () {
      let id = $('#id').val();
      let price = $('#price').val();
      let model = $('#model').val();

      if (id == '' || id == null) {
        alert('Id is Mandatory');
        $('#id').focus();
        return;
      }
      if (price == '' || price == null) {
        alert('Price is Mandatory');
        $('#price').focus();
        return;
      }
      if (model == '' || model == null) {
        alert('Model is Mandatory');
        $('#model').focus();
        return;
      }
      this.send();
    },
    send: function () {
      // method, action
      $('#register_form').attr('method', 'post');
      $('#register_form').attr('action', '/car/updateimpl');
      $('#register_form').submit();
    }
  };

  $(function () {
    detail.init();
  });
</script>

<div class="col-sm-10">
  <h2>Detail Page</h2>
  <div class="row">
    <div class="col-sm-8">
      <form id="register_form">
        <div class="form-group">
          <label for="id">Id:<span id="id_span"></span></label>
          <input type="text" readonly value="${car.carId}" class="form-control" placeholder="Enter id" id="id"
                 name="carId">
        </div>
        <div class="form-group">
          <label for="price">Price:</label> <!-- 수정된 필드 -->
          <input type="number" value="${car.carPrice}" class="form-control" placeholder="Enter price" id="price"
                 name="carPrice">
        </div>
        <div class="form-group">
          <label for="model">Model:</label> <!-- 수정된 필드 -->
          <input type="text" value="${car.carModel}" class="form-control" placeholder="Enter model" id="model"
                 name="carModel">
        </div>
        <button type="button" id="update_btn" class="btn btn-primary">Update</button>
        <button type="button" id="delete_btn" class="btn btn-primary">Delete</button>
      </form>
    </div>
  </div>
</div>
