## 로또 미션 저장소
### Effective Swift
NEXTSTEP with yagom-academy

### 프로그래밍 요구사항 분석
1. 사용자로부터 입력받는다. -> InputView
2. 입력을 구분자를 기준으로 분리한다. -> Splitter
3. 입력을 숫자로 캐스팅한다. -> InputParser
    - InputParser는 NumberGenerator와 Splitter를 삽입받아서 만들어진다.
    - InputParser는 NumberGenerator를 이용하여 연산에 필요한 숫자를 만든다.
    - InputParser는 Splitter를 이용하여 숫자를 나눈다.
4. 입력을 덧셈으로 더한다. -> Calculator.calculate
5. 문자열 계산기에 숫자 이외의 값 또는 음수를 전달하는 경우 **`Error`**를 **`throw`** 합니다 -> NumberGenerator 담당
6. 숫자 하나는 그대로 반환해야 한다. -> NumberGenerator 
7. 빈문자열, nil은 0으로 취급한다. -> NumberGenerator 

### 추후 변경될 수 있는 기획사항
1. 구분자의 종류가 변화할 수 있다.
모든 구분자가 `protocol Sepeartor`를 따르도록 한다.  
`Spliter`는 `Separator` 를 주입받으며, 주입받은 `Separator`를 기준으로 split한다.  
    
2. 음수가 가능해질 수 있다. 
- 양수, 음수, double, 소숫점 계산도 지원한다면 어떻게 해야하는가?
- 오른쪽으로 갈 수록 범위가 커지고, 왼쪽의 것을 포함한다. (UInt, Int, Float, Double)  
- UIntGenerator, IntGEnerator, FloatGenerator, DoubleGenerator 이런식으로 각각의 Generator를 만들면 어떨까?    
    
3. 덧셈이 아니라 다른 기능도 지원할 수 있다.
- 게산기에 따라 연산 방식이 달라질 수 있다.
    - ex) 지원하는 연산 (덧셈, 나머지 연산...), 연산자 우선순위
- 계산기는 `protocol Calculator`를 따른다.
- Calculotor는 initialzer를 통해 연산자를 주입받으며, 주입받은 연산자만 연산을 수행할 수 있다.
- `protocol Calculator` 는 다음과 같은 프로퍼티와 메서드를 갖는다.
    1. `let operators: Set<Operator>` 자신이 지원하는 연산자 목록
    2. `func calculate(numbers: [Int], operator: [Operator])`: numbers와 operator를 받아서 연산을 수행한다.
    
    

