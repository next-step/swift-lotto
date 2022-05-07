## 로또 미션 저장소
### Effective Swift
NEXTSTEP with yagom-academy

### 프로그래밍 요구사항 분석
1. 사용자로부터 입력받는다. -> InputView
2. 입력을 구분자를 기준으로 분리한다. -> Splitter
3. 입력을 숫자로 캐스팅한다. -> InputParser
4. 입력을 덧셈으로 더한다. -> StringPlusCalcutor.calculate: 
5. InputParser: 문자열 계산기에 숫자 이외의 값 또는 음수를 전달하는 경우 **`Error`**를 **`throw`** 합니다
    1. 숫자 이외 의 값(구분자 외의 값), 음수를 전달하는 경우 
6. 숫자 하나는 그대로 반환해야 한다.
7. 빈문자열, nil은 0으로 취급한다.

