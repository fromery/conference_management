$(document).ready(function () {
    var page = new Page();
    page.init();
});

function Page() {

}

Page.prototype.init = function () {
    var that = this;
    $.get(root + "/api/users/all", function (data) {
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
    var $roleCell = $("<td/>").text(row.role);

    var $actions = $("<td/>").attr("class", "actions");
    var $viewLink = $("<a/>").attr("href", root + "/api/users/view/" + row.id).attr("class", "viewLink").text("View");
    var $updateLink = $("<a/>").attr("href", root + "/api/users/update/" + row.id).attr("class", "updateLink").text("Update");
    var $deleteLink = $("<a/>").attr("href", root + "/apiusers/delete/" + row.id).attr("class", "deleteLink").text("Delete");

    $actions.append($viewLink).append($updateLink).append($deleteLink);

    $row.append($firstnameCell, $lastnameCell, $roleCell, $actions);
    return $row;
};
