function createModel(parent) {
    var s = 'import QtQuick 2.0; ListModel {\n';
    var datax = [1, 2];  // your data from database will be here
    var datay = [2, 3];
    var c = 0;
    for(var x in datax) {
        for(var y in datay) {
            var s2 = "ListElement {name: \"" + datax[x] + "\"; number: \"" + datay[parseInt(y)+c] + "\" }\n";
            s += s2;
            break;
        }
        c++;
    }

    s += "}\n";
    return Qt.createQmlObject(s, parent, "mainModel");
}