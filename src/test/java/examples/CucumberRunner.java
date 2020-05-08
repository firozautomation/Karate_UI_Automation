package examples;
import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import static org.junit.Assert.*;
import org.junit.BeforeClass;
import org.junit.Test;
// @RunWith(Karate.class)
// @CucumberOptions(features = "src/test/java" )
// @KarateOptions(features = "classpath:demo/read/read-files.feature")
// @Cucumber.Options(features={"VerifyFirstName.feature", "EmailNotpreRegister.feature","PasswordCharacter.feature"})
public class CucumberRunner {
    @Test
    public void testParallel() {
        //System.setProperty("karate.env", "examples"); // ensure reset if other tests (e.g. mock) had set env in CI
        //Results results = Runner.path("classpath:examples").tags("~@ignore").parallel(5);
        generateReport(results.getReportDir());
        String karateOutputPath = "target/surefire-reports"; 
        generateReport(karateOutputPath);
    }
    public static void generateReport(String karateOutputPath) {        
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();        
    }
    
}
    
}
}
