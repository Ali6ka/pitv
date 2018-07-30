package kg.edu.iaau.pitv.config;

import kg.edu.iaau.pitv.tiles.MasterPreparer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.tiles3.SpringBeanPreparerFactory;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration
@EnableScheduling
@EnableAsync
public class WebAppConfig extends WebMvcConfigurerAdapter
{
    @Value("${system.app.external.resource.location}")
    private String externalResource;

    public void addResourceHandlers(ResourceHandlerRegistry registry)
    {
        registry.addResourceHandler(new String[]{"/assets/**"})
                .addResourceLocations(new String[]{"/assets/"}).setCachePeriod(31556926);
        registry.addResourceHandler(new String[]{"/resources/**"})
                .addResourceLocations(new String[]{"file:" + this.externalResource});
    }

    @Bean
    public MasterPreparer masterPreparer() {
        return new MasterPreparer();
    }

    @Bean
    public TilesConfigurer tilesConfigurer()
    {
        TilesConfigurer tc = new TilesConfigurer();
        tc.setDefinitions(new String[]{"/WEB-INF/tiles.xml"});
        tc.setCheckRefresh(true);
        tc.setPreparerFactoryClass(SpringBeanPreparerFactory.class);
        return tc;
    }
}
