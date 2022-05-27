## 로또 미션 저장소
### Effective Swift
NEXTSTEP with yagom-academy

## Step1

### 기능 요구 사항
- 쉼표(,) 또는 콜론(:)을 구분자로 가지는 문자열을 전달하는 경우 구분자를 기준으로 분리한 각 숫자의 합을 반환합니다 (예: "" => 0, "1,2" => 3, "1,2,3" => 6, "1,2:3" => 6)
- 문자열 계산기에 숫자 이외의 값 또는 음수를 전달하는 경우 `Error`를 `throw` 합니다.


### 프로그래밍 요구 사항
- indent(인덴트, 들여쓰기) depth가 2를 넘지 않도록 구현합니다. 1까지만 허용합니다.
- 예를 들어 while문 안에 if문이 있으면 들여쓰기는 2입니다.
- 힌트: indent(인덴트, 들여쓰기) depth를 줄이는 좋은 방법은 함수(또는 메서드)를 분리하는 것입니다.
- 함수(또는 메서드)의 길이가 10라인을 넘어가지 않도록 구현합니다.
- 함수(또는 메서드)가 한 가지 일만 잘 하도록 구현합니다.
- TDD를 기반으로 미션을 수행합니다.


### HINT
- 1. 빈 문자열 또는 nil을 입력할 경우 0을 반환해야 합니다. (예 : "" => 0, nil => 0)
``` swift
guard let input: String = input, 
    input.isEmpty == false else {
    return 0
}
```

2. 숫자 하나를 문자열로 입력할 경우 해당 숫자를 반환합니다.(예 : "1")
``` swift
if let number: Int = Int(input) {
    return number
}
```

3. 숫자 두개를 컴마(,) 구분자로 입력할 경우 두 숫자의 합을 반환합니다. (예 : "1,2")
``` swift
let numbers = input.components(seperatedBy: ",")
```

4. 구분자를 컴마(,) 이외에 콜론(:)을 사용할 수 있습니다. (예 : "1,2:3" => 6)
``` swift
let components = input.components(separatedBy: ",:")
```

5. 음수를 전달할 경우 Error 예외가 발생해야 합니다. (예 : "-1,2,3")
