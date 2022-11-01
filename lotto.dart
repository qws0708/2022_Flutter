import 'dart:math';


//List는 중복 허용
//Set은 중복을 허용하지는 않으나 중복된 값을 삭제함 -> while문을 통해 수정

Set<int> lottoNumber(){

  final random = Random();

  final Set<int> lottoSet = {};
  //var num;

  while(lottoSet.length !=6){

    //num = random.nextInt(45) + 1;
    lottoSet.add(random.nextInt(45) + 1);
  }

  print('당첨번호');
  print(lottoSet.toList());

  return lottoSet;
}

Set<int> myNumber(){

  final random = Random();

  final Set<int> mySet = {};

  //var num;

  while(mySet.length !=6){
    //num = random.nextInt(45) + 1;
    mySet.add(random.nextInt(45) + 1);
  }

  print('내 추첨번호');
  print(mySet.toList());

  return mySet;
}

void checkNumber(lottoSet, mySet){

  int match = 0;

  for(int lotto in lottoSet){
    for(int myNum in mySet){

      if(lotto == myNum){
        match++;
        print('당첨번호: $myNum');
      }
      //print('로또번호 = $lotto');
      //print('내 추첨번호 = $myNum');
    }
  }
  print('$match개의 당첨번호가 있습니다!');
}

void main(){

  Set<int>lottoFinal = lottoNumber();
  Set<int>myFinal = myNumber();

  checkNumber(lottoFinal, myFinal);
}