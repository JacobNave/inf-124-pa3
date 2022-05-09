package com.uci.inf124;

public class Converter {

    private String celsius;
    private String fahrenheit;

    public void setCelsius(String celsius) {
        this.celsius = celsius;
    }
    
    public String getCelsius() {
        return celsius;
    }

    public String getFahrenheit() {
        this.fahrenheit = Float.toString(1.8f * Integer.parseInt(celsius) + 32.0f);
        return fahrenheit;
    }

    public void setFahrenheit(String fahrenheit) {
        this.fahrenheit = fahrenheit;
    }
}