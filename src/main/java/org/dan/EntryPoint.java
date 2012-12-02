package org.dan;


import com.google.gson.Gson;
import org.antlr.runtime.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Daneel Yaitskov
 */
public class EntryPoint {

    /**
     * print error message to stderr and exit with code -1
     */
    public static void err(String msg) {
        System.err.println(msg);
        System.exit(-1);
    }

    /** entry point to the parser. takes 1 argument, path to config file. */
    public static void main(String[] args) {
        if (args.length != 1) {
            err("Invalid number of arguments. Path to conf file is expected.");
        }
        String confPath = args[0];
        InputStream confFile = null;
        try {
            confFile = new FileInputStream(confPath);
        } catch (IOException e) {
            err("Cannot open file '" + confPath + "' cause: " + e.getMessage());
        }
        try {
            CharStream input = new ANTLRInputStream(confFile, "UTF-8");
            L l = new L(input);
            CommonTokenStream stream = new CommonTokenStream(l);
            P p = new P(stream);
            List<Plugin> plugins = p.plugins();
            Gson gson = new Gson();
            System.out.println("json serialized output: " + gson.toJson(plugins));
        } catch (InvalidConfException e) {
            err("Invalid config");
        } catch (IOException e) {
            err("Failed to read file '" + confPath + "' cause: " + e.getMessage());
        } catch (RecognitionException e) {
            err("Failed to parse file '" + confPath + "' cause: " + e.getMessage());
        }
    }
}
