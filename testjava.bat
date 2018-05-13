del outjava\TestAstro.jar
haxe -java outjava -cp src -main TestAstro -lib hxtime
"%JAVA_HOME%\bin\jar.exe" uvf outjava\TestAstro.jar assets/ef2 assets/geodata assets/vip -C /HaxeToolkit/haxe/lib/hxtime/1,0,0/ assets/tz
java -jar outjava\TestAstro.jar
