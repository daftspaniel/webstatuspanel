library pagetemplate;

import 'serverstatus.dart';

buildPage() async {
  ServerStatus status = new ServerStatus();
  String pageTemplate = """
<!DOCTYPE html>
<html>

<head>
  <script data-require="jquery@*" data-semver="2.1.4" src="https://code.jquery.com/jquery-2.1.4.js"></script>
  <script data-require="bootstrap@*" data-semver="3.3.6" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link data-require="bootstrap-css@3.3.6" data-semver="3.3.6" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" />
  <link rel="stylesheet" href="style.css" />
  <script src="script.js"></script>
</head>

<body>

<div style="padding-left:40px">
  <h1>Status Panel</h1>
<div>
  <div class="container">

    <ul class="nav nav-tabs">
      <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
      <li><a data-toggle="tab" href="#menu1">System</a></li>
      <li><a data-toggle="tab" href="#menu2">Time</a></li>
      <li><a data-toggle="tab" href="#menu3">About</a></li>
    </ul>

    <div class="tab-content">
      <div id="home" class="tab-pane fade in active">

        <table class="table table-condensed">
          <thead>
            <tr>
              <th></th>
              <th>Environment Variables</th>
            </tr>
          </thead>
          <tbody>
          ${status.environmentVars}
          </tbody>
        </table>

      </div>
      <div id="menu1" class="tab-pane fade">
        <table class="table table-condensed">
          <tbody>
            <tr>
              <td>Computer Name</td>
              <td>${status.localHostname}</td>
            </tr>
            <tr>
              <td>OS</td>
              <td>${status.operatingSystem}</td>
            </tr>
            <tr>
              <td>Processors</td>
              <td>${status.numberOfProcessors}</td>
            </tr>
            <tr>
              <td>isLinux</td>
              <td>${status.isLinux}</td>
            </tr>
            <tr>
              <td>isIOS</td>
              <td>${status.isIOS}</td>
            </tr>
            <tr>
              <td>isAndroid</td>
              <td>${status.isAndroid}</td>
            </tr>
            <tr>
              <td>isWindows</td>
              <td>${status.isWindows}</td>
            </tr>
            <tr>
              <td>isMacOS</td>
              <td>${status.isMacOS}</td>
            </tr>
            <tr>
              <td><i>Memory Usage</i></td>
              <td><pre>${await status.memoryUsage}</pre></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div id="menu2" class="tab-pane fade">
        <table class="table table-condensed">
          <thead>
            <tr>
              <th></th>
              <th>Date and Time</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><i>Client</i></td>
              <td><script type="">document.write(Date())</script></td>
            </tr>
            <tr>
              <td><i>Server</i></td>
              <td>${status.time}</td>
            </tr>
            <tr>
              <td><i>Calendar</i></td>
              <td><pre>${await status.cal}</pre></td>
            </tr>
            <tr>
              <td><i>Uptime</i></td>
              <td>${await status.uptime}</td>
            </tr>

          </tbody>
        </table>

      </div>
      <div id="menu3" class="tab-pane fade">
        <h3>About</h3>
        <p>Client side jQuery and Bootstrap.</p>
        <p>Server built with <a href="http://www.dartlang.org/">Dart</a>.</p>
        <p>Dart Version : ${status.dartVersion}</p>
        <p>Dart Executable : ${status.executable}</p>
        <p>Executable : ${status.resolvedExecutable}</p>
      </div>
    </div>
  </div>


</body>

</html>
""";
  return pageTemplate;
}
