$(document).ready(function () {
    var page = new Page();
    page.init();
    console.log('INIT!');
});

function Page() {

}

Page.prototype.init = function () {
    var that = this;
    $.get(root + "/users/all", function (data) {
        that.displayTable(data);
    });
};

Page.prototype.displayTable = function (rows) {

    if (!rows.length) return;

    var tmpRows = [];
    var $tableBody = $("#user-table tbody");

    for (var i = 0; i < rows.length; i++) {
        tmpRows.push(this.createRowHtml(rows[i]));
    }

    $tableBody.empty();
    $tableBody.append(tmpRows);
};

Page.prototype.createRowHtml = function (row) {

    var $row = $("<tr/>");
    var $firstnameCell = $("<td/>").text(row.firstName);
    var $lastnameCell = $("<td/>").text(row.lastName);
    var $emailCell = $("<td/>").text(row.email);
    var $roleCell = $("<td/>").text(row.role);

    $row.append($firstnameCell, $lastnameCell, $emailCell, $roleCell);
    return $row;
};