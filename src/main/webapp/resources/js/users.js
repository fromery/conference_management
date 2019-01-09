$(document).ready(function(){
    var page = new Page();
    page.init();
});

function Page(){

}

Page.prototype.init = function(){
    var that = this;
    $("#appointment-dt").datepicker({autoclose:true});
    $("#services").multiselect();
    this.bindButtons();
    $.get(root + "/users/all", function(data){
        that.displayTable(data);
    });
};