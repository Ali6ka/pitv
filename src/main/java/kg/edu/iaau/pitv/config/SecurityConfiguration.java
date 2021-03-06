package kg.edu.iaau.pitv.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests()
                .antMatchers("/", "/home").hasAnyRole("ADMIN","USER")
                .antMatchers("/dashboard/**").hasAnyRole("ADMIN")
                .antMatchers("/schedule/*", "/clock").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login").successForwardUrl("/")
                .permitAll()
                .usernameParameter("ssoId")
                .passwordParameter("password")
                .and()
                .logout()
                .permitAll()
                .and()
                .exceptionHandling().accessDeniedPage("/accessDenied");
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
    }

}
