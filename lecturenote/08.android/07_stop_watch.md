## 07 스톱워치: 스레드

![image](https://github.com/sangeun99/hyundai-it-e-msa-fullstack/assets/63828057/66db9ee2-ce87-4e1a-9c98-d7dba196267e)

### 메인 스레드와 백그라운드 스레드

- 메인 스레드
    - 앱이 처음 시작될 때 시스템이 생성하는 하나의 스레드
    - 역할
        - 액티비티의 모든 생명 주기 관련 콜백 실행을 담당
        - 버튼, 에디트텍스트와 같은 UI 위젯을 사용한 사용자 이벤트와 UI 드로잉 이벤트를 담당
- 백그라운드 스레드
    - 메인 스레드에서 너무 많은 일을 처리하지 않도록 도와줌
    - UI 관련 작업은 절대 하면 안 됨
        - 각 백그라운드 스레드가 언제 처리를 끝내고 UI에 접근할지 그 순서를 알 수 없기 때문에 UI는 메인 스레드에서만 수정하게 함

### runOnUiThread() 메서드

- UI 스레드에서 코드를 실행시킬 때 쓰는 액티비티 클래스의 메서드

### 스톱워치 만들기

- SDK 버전 설정
    
    ![스크린샷 2024-01-15 오후 3.32.01.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/e9e2ce04-3c8c-4e77-a34f-f06eec9d1660/6ace40f8-fa6b-4f49-865a-4e256a07a728/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-01-15_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_3.32.01.png)
    
    - compileSdk
        - Gradle에 어떤 안드로이드 SDK 버전으로 앱을 컴파일할 것인지 명시
    - minSdk
        - 앱을 사용할 수 있는 최소한의 API 레벨
    - targetSdk
        - 앱이 기기에서 동작할 때 사용하는 SDK 버전

### MainActivity.kt

```kotlin
package net.developia.a07_stopwatch

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.TextView
import java.util.Timer
import kotlin.concurrent.timer

class MainActivity : AppCompatActivity(), View.OnClickListener {

    var isRunning = false
    var timer: Timer? = null
    var time = 0

    private lateinit var btn_start: Button
    private lateinit var btn_refresh: Button
    private lateinit var tv_millisecond: TextView
    private lateinit var tv_second: TextView
    private lateinit var tv_minute: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        btn_start = findViewById(R.id.btn_start)
        btn_refresh = findViewById(R.id.btn_refresh)
        tv_millisecond = findViewById(R.id.tv_millisecond)
        tv_second = findViewById(R.id.tv_second)
        tv_minute = findViewById(R.id.tv_minute)

        btn_start.setOnClickListener(this)
        btn_refresh.setOnClickListener(this)
    }

    override fun onClick(v: View?) {
        when(v?.id) {
            R.id.btn_start -> {
                if (isRunning) {
                    pause()
                }
                else {
                    start()
                }
            }
            R.id.btn_refresh -> {
                refresh()
            }
        }
    }

    private fun start() {
        btn_start.text = "일시정지"
        btn_start.setBackgroundColor(getColor(R.color.red))
        isRunning = true

        timer = timer(period = 10) {
            time++

            val milli_second = time % 100
            val second = (time % 6000) / 100
            val minute = time / 6000

            runOnUiThread {
                tv_millisecond.text =
                    if (milli_second < 10) ".0${milli_second}" else ".${milli_second}"
                tv_second.text = if (second < 10) ":0${second}" else ":${second}"
                tv_minute.text = if (minute < 10) "0${minute}" else "${minute}"
            }
        }
    }

    private fun pause() {
        btn_start.text = "시작"
        btn_start.setBackgroundColor(getColor(R.color.blue))

        isRunning = false
        timer?.cancel()
    }

    private fun refresh() {
        timer?.cancel()
        btn_start.text = "시작"
        btn_start.setBackgroundColor(getColor(R.color.blue))
        isRunning = false

        time = 0
        tv_millisecond.text = ".00"
        tv_second.text = ":00"
        tv_minute.text = "00"
    }
}
```

### activity_main.xml

```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <Button
        android:id="@+id/btn_start"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginBottom="80dp"
        android:backgroundTint="@color/blue"
        android:padding="20dp"
        android:text="@string/start"
        android:textSize="16sp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent" />

    <Button
        android:id="@+id/btn_refresh"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_margin="50dp"
        android:backgroundTint="@color/yellow"
        android:padding="20dp"
        android:text="@string/refresh"
        android:textSize="16sp"
        app:layout_constraintBottom_toTopOf="@+id/btn_start"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent" />

    <TextView
        android:id="@+id/tv_minute"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="00"
        android:textSize="45sp"
        app:layout_constraintBaseline_toBaselineOf="@+id/tv_second"
        app:layout_constraintEnd_toStartOf="@+id/tv_second"
        app:layout_constraintHorizontal_bias="0.5"
        app:layout_constraintHorizontal_chainStyle="packed"
        app:layout_constraintStart_toStartOf="parent" />

    <TextView
        android:id="@+id/tv_second"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text=":00"
        android:textSize="45sp"
        app:layout_constraintBottom_toTopOf="@+id/btn_refresh"
        app:layout_constraintEnd_toStartOf="@+id/tv_millisecond"
        app:layout_constraintHorizontal_bias="0.5"
        app:layout_constraintStart_toEndOf="@+id/tv_minute"
        app:layout_constraintTop_toTopOf="parent" />

    <TextView
        android:id="@+id/tv_millisecond"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text=".00"
        android:textSize="30sp"
        app:layout_constraintBaseline_toBaselineOf="@+id/tv_second"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.5"
        app:layout_constraintStart_toEndOf="@+id/tv_second" />
</androidx.constraintlayout.widget.ConstraintLayout>
```