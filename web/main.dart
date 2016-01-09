import 'dart:html';

ButtonElement genButton;

void main() {
  querySelector('#artist-input').onInput.listen(updateAlbum);
  genButton = querySelector('#generateButton');
  genButton.onClick.listen(generateBadge);
}

void updateAlbum(Event e) {
  String inputName = (e.target as InputElement).value;
  setAlbumName(inputName);
  // setBadgeName(inputName);
  // if (inputName.trim().isEmpty) {
  //   genButton
  //     ..disabled = false
  //     ..text = 'Enter';
  // } else {
  //   genButton
  //     ..disabled = true
  //     ..text = 'Ok';
  // }
}

void setAlbumName(String newName) {
  querySelector('.artist-name').text = newName;
}
