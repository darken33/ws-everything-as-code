package karate;


import com.intuit.karate.junit5.Karate;

public class KarateRunnerTest {

    @Karate.Test
    Karate hello() {
        return Karate.run()
        		.relativeTo(getClass());
    }
}
