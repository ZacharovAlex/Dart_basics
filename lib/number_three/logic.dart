class ParseStringForNum {
  final String _data;

  ParseStringForNum(this._data);

  List<dynamic> parsing() {
    var j;
    var temp = [];                   //TODO test  //fdh5 fdf6.668.90 gf98. fd-8jjk-7.78j --66 -54-76.9kj-8..5d  -0.43-
    var answer = [];
    for (var i = 0; i < _data.length; i++) {
      j = int.tryParse(_data[i]);
      if (j != null) {
        temp.add(j);
        if (i == _data.length - 1 && temp.isNotEmpty) {
          answer.add(_arrayToNum(temp));
          temp.clear();
        }
      } else if (temp.isNotEmpty) {
        if (i < _data.length - 1 && _data[i] == '-' && int.tryParse(_data[i + 1]) != null) {
          answer.add(_arrayToNum(temp));
          temp.clear();
          temp.add(_data[i]);
          continue;
        }
        if (_data[i] == '.' && !temp.contains('.')) {
          if (i == _data.length - 1) {
            answer.add(_arrayToNum(temp));
            temp.clear();
            continue;
          } else {
            temp.add(_data[i]);
          }
        } else {
          answer.add(_arrayToNum(temp));
          temp.clear();
          continue;
        }
      } else if (i < _data.length - 1 && _data[i] == '-' && int.tryParse(_data[i + 1]) != null) {
        temp.add(_data[i]);
      }
      {
        continue;
      }
    }
    return answer;
  }

  num? _arrayToNum(List<dynamic> arrayOfDigits) {
    var result = '';
    result = arrayOfDigits.join('');
    return int.tryParse(result) ?? double.tryParse(result);
  }
}
