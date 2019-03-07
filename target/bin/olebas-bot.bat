@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup
set REPO=


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\telegram\telegrambots\4.1.2\telegrambots-4.1.2.jar;"%REPO%"\org\telegram\telegrambots-meta\4.1.2\telegrambots-meta-4.1.2.jar;"%REPO%"\com\google\inject\guice\4.2.2\guice-4.2.2.jar;"%REPO%"\javax\inject\javax.inject\1\javax.inject-1.jar;"%REPO%"\aopalliance\aopalliance\1.0\aopalliance-1.0.jar;"%REPO%"\com\google\guava\guava\25.1-android\guava-25.1-android.jar;"%REPO%"\org\checkerframework\checker-compat-qual\2.0.0\checker-compat-qual-2.0.0.jar;"%REPO%"\com\google\errorprone\error_prone_annotations\2.1.3\error_prone_annotations-2.1.3.jar;"%REPO%"\com\google\j2objc\j2objc-annotations\1.1\j2objc-annotations-1.1.jar;"%REPO%"\org\codehaus\mojo\animal-sniffer-annotations\1.14\animal-sniffer-annotations-1.14.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-annotations\2.9.0\jackson-annotations-2.9.0.jar;"%REPO%"\com\fasterxml\jackson\jaxrs\jackson-jaxrs-json-provider\2.9.8\jackson-jaxrs-json-provider-2.9.8.jar;"%REPO%"\com\fasterxml\jackson\jaxrs\jackson-jaxrs-base\2.9.8\jackson-jaxrs-base-2.9.8.jar;"%REPO%"\com\fasterxml\jackson\module\jackson-module-jaxb-annotations\2.9.8\jackson-module-jaxb-annotations-2.9.8.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-databind\2.9.8\jackson-databind-2.9.8.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-core\2.9.8\jackson-core-2.9.8.jar;"%REPO%"\org\glassfish\jersey\media\jersey-media-json-jackson\2.25.1\jersey-media-json-jackson-2.25.1.jar;"%REPO%"\org\glassfish\jersey\core\jersey-common\2.25.1\jersey-common-2.25.1.jar;"%REPO%"\org\glassfish\jersey\bundles\repackaged\jersey-guava\2.25.1\jersey-guava-2.25.1.jar;"%REPO%"\org\glassfish\hk2\osgi-resource-locator\1.0.1\osgi-resource-locator-1.0.1.jar;"%REPO%"\org\glassfish\jersey\ext\jersey-entity-filtering\2.25.1\jersey-entity-filtering-2.25.1.jar;"%REPO%"\org\glassfish\jersey\containers\jersey-container-grizzly2-http\2.25.1\jersey-container-grizzly2-http-2.25.1.jar;"%REPO%"\org\glassfish\hk2\external\javax.inject\2.5.0-b32\javax.inject-2.5.0-b32.jar;"%REPO%"\org\glassfish\grizzly\grizzly-http-server\2.3.28\grizzly-http-server-2.3.28.jar;"%REPO%"\org\glassfish\grizzly\grizzly-http\2.3.28\grizzly-http-2.3.28.jar;"%REPO%"\org\glassfish\grizzly\grizzly-framework\2.3.28\grizzly-framework-2.3.28.jar;"%REPO%"\javax\ws\rs\javax.ws.rs-api\2.0.1\javax.ws.rs-api-2.0.1.jar;"%REPO%"\org\glassfish\jersey\core\jersey-server\2.25.1\jersey-server-2.25.1.jar;"%REPO%"\org\glassfish\jersey\core\jersey-client\2.25.1\jersey-client-2.25.1.jar;"%REPO%"\org\glassfish\jersey\media\jersey-media-jaxb\2.25.1\jersey-media-jaxb-2.25.1.jar;"%REPO%"\javax\annotation\javax.annotation-api\1.2\javax.annotation-api-1.2.jar;"%REPO%"\org\glassfish\hk2\hk2-api\2.5.0-b32\hk2-api-2.5.0-b32.jar;"%REPO%"\org\glassfish\hk2\hk2-utils\2.5.0-b32\hk2-utils-2.5.0-b32.jar;"%REPO%"\org\glassfish\hk2\external\aopalliance-repackaged\2.5.0-b32\aopalliance-repackaged-2.5.0-b32.jar;"%REPO%"\org\glassfish\hk2\hk2-locator\2.5.0-b32\hk2-locator-2.5.0-b32.jar;"%REPO%"\org\javassist\javassist\3.20.0-GA\javassist-3.20.0-GA.jar;"%REPO%"\javax\validation\validation-api\1.1.0.Final\validation-api-1.1.0.Final.jar;"%REPO%"\org\json\json\20180813\json-20180813.jar;"%REPO%"\org\apache\httpcomponents\httpclient\4.5.3\httpclient-4.5.3.jar;"%REPO%"\org\apache\httpcomponents\httpcore\4.4.6\httpcore-4.4.6.jar;"%REPO%"\commons-logging\commons-logging\1.2\commons-logging-1.2.jar;"%REPO%"\commons-codec\commons-codec\1.9\commons-codec-1.9.jar;"%REPO%"\org\apache\httpcomponents\httpmime\4.5.3\httpmime-4.5.3.jar;"%REPO%"\commons-io\commons-io\2.5\commons-io-2.5.jar;"%REPO%"\org\jsoup\jsoup\1.11.3\jsoup-1.11.3.jar;"%REPO%"\org\codehaus\mojo\appassembler-maven-plugin\2.0.0\appassembler-maven-plugin-2.0.0.jar;"%REPO%"\org\codehaus\mojo\appassembler\appassembler-model\2.0.0\appassembler-model-2.0.0.jar;"%REPO%"\net\java\dev\stax-utils\stax-utils\20060502\stax-utils-20060502.jar;"%REPO%"\stax\stax\1.1.1-dev\stax-1.1.1-dev.jar;"%REPO%"\junit\junit\3.8.1\junit-3.8.1.jar;"%REPO%"\org\codehaus\plexus\plexus-utils\3.0.24\plexus-utils-3.0.24.jar;"%REPO%"\org\codehaus\plexus\plexus-interpolation\1.22\plexus-interpolation-1.22.jar;"%REPO%"\org\apache\maven\shared\maven-mapping\1.0\maven-mapping-1.0.jar;"%REPO%"\stax\stax-api\1.0.1\stax-api-1.0.1.jar;"%REPO%"\org\apache\maven\maven-model\2.2.1\maven-model-2.2.1.jar;"%REPO%"\org\apache\maven\maven-plugin-api\2.2.1\maven-plugin-api-2.2.1.jar;"%REPO%"\org\apache\maven\maven-project\2.2.1\maven-project-2.2.1.jar;"%REPO%"\org\apache\maven\maven-settings\2.2.1\maven-settings-2.2.1.jar;"%REPO%"\org\apache\maven\maven-profile\2.2.1\maven-profile-2.2.1.jar;"%REPO%"\org\apache\maven\maven-artifact-manager\2.2.1\maven-artifact-manager-2.2.1.jar;"%REPO%"\org\apache\maven\maven-repository-metadata\2.2.1\maven-repository-metadata-2.2.1.jar;"%REPO%"\org\apache\maven\wagon\wagon-provider-api\1.0-beta-6\wagon-provider-api-1.0-beta-6.jar;"%REPO%"\backport-util-concurrent\backport-util-concurrent\3.1\backport-util-concurrent-3.1.jar;"%REPO%"\org\apache\maven\maven-plugin-registry\2.2.1\maven-plugin-registry-2.2.1.jar;"%REPO%"\org\codehaus\plexus\plexus-container-default\1.0-alpha-9-stable-1\plexus-container-default-1.0-alpha-9-stable-1.jar;"%REPO%"\classworlds\classworlds\1.1-alpha-2\classworlds-1.1-alpha-2.jar;"%REPO%"\org\apache\maven\shared\maven-filtering\1.3\maven-filtering-1.3.jar;"%REPO%"\org\apache\maven\maven-core\2.2.1\maven-core-2.2.1.jar;"%REPO%"\org\apache\maven\wagon\wagon-file\1.0-beta-6\wagon-file-1.0-beta-6.jar;"%REPO%"\org\apache\maven\maven-plugin-parameter-documenter\2.2.1\maven-plugin-parameter-documenter-2.2.1.jar;"%REPO%"\org\apache\maven\wagon\wagon-http-lightweight\1.0-beta-6\wagon-http-lightweight-1.0-beta-6.jar;"%REPO%"\org\apache\maven\wagon\wagon-http-shared\1.0-beta-6\wagon-http-shared-1.0-beta-6.jar;"%REPO%"\nekohtml\xercesMinimal\1.9.6.2\xercesMinimal-1.9.6.2.jar;"%REPO%"\nekohtml\nekohtml\1.9.6.2\nekohtml-1.9.6.2.jar;"%REPO%"\org\apache\maven\wagon\wagon-http\1.0-beta-6\wagon-http-1.0-beta-6.jar;"%REPO%"\org\apache\maven\wagon\wagon-webdav-jackrabbit\1.0-beta-6\wagon-webdav-jackrabbit-1.0-beta-6.jar;"%REPO%"\org\apache\jackrabbit\jackrabbit-webdav\1.5.0\jackrabbit-webdav-1.5.0.jar;"%REPO%"\org\apache\jackrabbit\jackrabbit-jcr-commons\1.5.0\jackrabbit-jcr-commons-1.5.0.jar;"%REPO%"\commons-httpclient\commons-httpclient\3.0\commons-httpclient-3.0.jar;"%REPO%"\org\slf4j\slf4j-nop\1.5.3\slf4j-nop-1.5.3.jar;"%REPO%"\org\slf4j\slf4j-jdk14\1.5.6\slf4j-jdk14-1.5.6.jar;"%REPO%"\org\slf4j\slf4j-api\1.5.6\slf4j-api-1.5.6.jar;"%REPO%"\org\slf4j\jcl-over-slf4j\1.5.6\jcl-over-slf4j-1.5.6.jar;"%REPO%"\org\apache\maven\reporting\maven-reporting-api\2.2.1\maven-reporting-api-2.2.1.jar;"%REPO%"\org\apache\maven\doxia\doxia-sink-api\1.1\doxia-sink-api-1.1.jar;"%REPO%"\org\apache\maven\doxia\doxia-logging-api\1.1\doxia-logging-api-1.1.jar;"%REPO%"\org\apache\maven\maven-error-diagnostics\2.2.1\maven-error-diagnostics-2.2.1.jar;"%REPO%"\commons-cli\commons-cli\1.2\commons-cli-1.2.jar;"%REPO%"\org\apache\maven\wagon\wagon-ssh-external\1.0-beta-6\wagon-ssh-external-1.0-beta-6.jar;"%REPO%"\org\apache\maven\wagon\wagon-ssh-common\1.0-beta-6\wagon-ssh-common-1.0-beta-6.jar;"%REPO%"\org\apache\maven\maven-plugin-descriptor\2.2.1\maven-plugin-descriptor-2.2.1.jar;"%REPO%"\org\codehaus\plexus\plexus-interactivity-api\1.0-alpha-4\plexus-interactivity-api-1.0-alpha-4.jar;"%REPO%"\org\apache\maven\maven-monitor\2.2.1\maven-monitor-2.2.1.jar;"%REPO%"\org\apache\maven\wagon\wagon-ssh\1.0-beta-6\wagon-ssh-1.0-beta-6.jar;"%REPO%"\com\jcraft\jsch\0.1.38\jsch-0.1.38.jar;"%REPO%"\org\sonatype\plexus\plexus-sec-dispatcher\1.3\plexus-sec-dispatcher-1.3.jar;"%REPO%"\org\sonatype\plexus\plexus-cipher\1.4\plexus-cipher-1.4.jar;"%REPO%"\org\apache\maven\shared\maven-shared-utils\0.6\maven-shared-utils-0.6.jar;"%REPO%"\com\google\code\findbugs\jsr305\2.0.1\jsr305-2.0.1.jar;"%REPO%"\org\sonatype\plexus\plexus-build-api\0.0.4\plexus-build-api-0.0.4.jar;"%REPO%"\org\apache\maven\maven-artifact\2.2.1\maven-artifact-2.2.1.jar;"%REPO%"\org\codehaus\plexus\plexus-archiver\3.2\plexus-archiver-3.2.jar;"%REPO%"\org\codehaus\plexus\plexus-io\2.7.1\plexus-io-2.7.1.jar;"%REPO%"\org\apache\commons\commons-compress\1.10\commons-compress-1.10.jar;"%REPO%"\org\iq80\snappy\snappy\0.4\snappy-0.4.jar;"%REPO%"\org\tukaani\xz\1.5\xz-1.5.jar;"%REPO%"\com\olebas\telebot\1.0-SNAPSHOT\telebot-1.0-SNAPSHOT.jar

set ENDORSED_DIR=
if NOT "%ENDORSED_DIR%" == "" set CLASSPATH="%BASEDIR%"\%ENDORSED_DIR%\*;%CLASSPATH%

if NOT "%CLASSPATH_PREFIX%" == "" set CLASSPATH=%CLASSPATH_PREFIX%;%CLASSPATH%

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS%  -classpath %CLASSPATH% -Dapp.name="olebas-bot" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" com.home.server.Main %CMD_LINE_ARGS%
if %ERRORLEVEL% NEQ 0 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
