package kg.edu.iaau.pitv;

import kg.edu.iaau.pitv.tiles.MasterPreparer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.SpringBeanPreparerFactory;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@SpringBootApplication
public class PitvApplication {

	public static void main(String[] args) {
		SpringApplication.run(PitvApplication.class, args);
	}

	@Bean
	public MasterPreparer masterPreparer() {
		return new MasterPreparer();
	}

	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tc = new TilesConfigurer();
		tc.setDefinitions(new String[]{"/WEB-INF/tiles.xml"});
		tc.setCheckRefresh(true);
		tc.setPreparerFactoryClass(SpringBeanPreparerFactory.class);
		return tc;
	}
}
