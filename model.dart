
class Animal{  //class는 객체를 만들기 위한 기본 설계도
  final String name;  //final은 앱이 실행될 때 변하지 않는 상수 앞에 붙여준다 => 객체를 만들기위해서 3가지 속성이 모두 전달되어야 함
  final String imgPath;
  final String location;

  Animal(this.name, this.location, this.imgPath);
}