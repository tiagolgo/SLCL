package br.edu.utfpr.cm.slcl.hibernate;

import br.edu.utfpr.cm.saa.entidades.Papel;
import br.edu.utfpr.cm.saa.entidades.Sistema;
import br.edu.utfpr.cm.saa.entidades.Usuario;
import br.edu.utfpr.cm.slcl.entitys.Bibliotecario;
import br.edu.utfpr.cm.slcl.entitys.Coordenador;
import br.edu.utfpr.cm.slcl.entitys.Curso;
import br.edu.utfpr.cm.slcl.entitys.Disciplina;
import br.edu.utfpr.cm.slcl.entitys.Evento;
import br.edu.utfpr.cm.slcl.entitys.Livro;
import br.edu.utfpr.cm.slcl.entitys.PedidoDeLivro;
import br.edu.utfpr.cm.slcl.entitys.Professor;
import br.edu.utfpr.cm.slcl.ldap.TransactionManager;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.mapping.PersistentClass;
import org.hibernate.tool.hbm2ddl.SchemaExport;

public class HibernateConfiguration {

    private static String userName = "root";
    private static String password = "root";
    //Faculdade
    private static String dataBase = "slcl";
    //Casa
    //private static String dataBase = "SLCL";
    //Principal
    private static String host = "localhost:3306";
    //EduardoDoido '-'
    //private static String host = "localhost:3307";
    private static AnnotationConfiguration cfg = null;
    private static SessionFactory factory = null;
    
    public static Session openConnect() {
        if (cfg == null) {
            cfg = new AnnotationConfiguration();
            cfg.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
            cfg.setProperty("hibernate.connection.username", userName);
            cfg.setProperty("hibernate.connection.password", password);
            cfg.setProperty("hibernate.connection.url", "jdbc:mysql://" + host + "/" + dataBase);
            cfg.setProperty("hibernate.show_sql", "false");
            cfg.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
            cfg.setProperty("hibernate.connection.autocommit", "true");

            cfg.addAnnotatedClass(Professor.class);
            cfg.addAnnotatedClass(Coordenador.class);
            cfg.addAnnotatedClass(Bibliotecario.class);
            cfg.addAnnotatedClass(Evento.class);
            cfg.addAnnotatedClass(Livro.class);
            cfg.addAnnotatedClass(Curso.class);
            cfg.addAnnotatedClass(Disciplina.class);
            cfg.addAnnotatedClass(PedidoDeLivro.class);
            cfg.addAnnotatedClass(Usuario.class);
            cfg.addAnnotatedClass(Papel.class);
            cfg.addAnnotatedClass(Sistema.class);

            factory = cfg.buildSessionFactory();
        }
        return factory.openSession();
    }
    
    
    public static AnnotationConfiguration getCfg() {
        return cfg;
    }

    public static void setCfg(AnnotationConfiguration cfg) {
        HibernateConfiguration.cfg = cfg;
    }

    public static String getDataBase() {
        return dataBase;
    }

    public static void setDataBase(String dataBase) {
        HibernateConfiguration.dataBase = dataBase;
    }

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String password) {
        HibernateConfiguration.password = password;
    }

    public static String getUserName() {
        return userName;
    }

    public static void setUserName(String userName) {
        HibernateConfiguration.userName = userName;
    }

    public static String getHost() {
        return host;
    }

    public static void setHost(String host) {
        HibernateConfiguration.host = host;
    }

    public static void criarSchema() {
        openConnect().close();
        org.hibernate.tool.hbm2ddl.SchemaExport schemaEx = new SchemaExport(cfg);
        schemaEx.create(true, true);
    }

    public static List<Object> runHQLQuery(String hql) {
        Session session = TransactionManager.getCurrentSession();
        return session.createQuery(hql).list();
    }

    public static ArrayList<Class> getEntityClasses() {
        ArrayList<Class> classes = new ArrayList<Class>();
        if (cfg == null) {
            openConnect();
        }
        Iterator i = cfg.getClassMappings();
        while (i.hasNext()) {
            classes.add(((PersistentClass) i.next()).getMappedClass());
        }
        return classes;
    }
}
