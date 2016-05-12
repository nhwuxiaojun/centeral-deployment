<html>
  <head>
    <title>jQuery UI Autocompleters Lab</title>
    <link rel="stylesheet" type="text/css" href="jQueryInAction/styles/core.css">
    <link rel="stylesheet" type="text/css" href="jQueryInAction/themes/cupertino/jquery-ui-1.8.custom.css">
    <script type="text/javascript" src="jQueryInAction/scripts/jquery-1.4.js"></script>
    <script type="text/javascript" src="jQueryInAction/scripts/jquery-ui-1.8.custom.min.js"></script>
    <script type="text/javascript" src="jQueryInAction/scripts/jqia2.support.js"></script>
    <script type="text/javascript">

      var sourceStrings = [
        "FX",
        "Fahrenheit 451",
        "Family Guy, Volume One, Seasons 1 and 2",
        "Family Plot",
        "Fantastic Four (1994), Disc 1",
        "Fantastic Four (1994), Disc 2",
        "Fantastic Four (1994), Disc 3",
        "Fantastic Four (1994), Disc 4",
        "Fantastic Planet",
        "Fantastic Voyage",
        "Fargo",
        "Farscape, Season 1, Volume 1",
        "Farscape, Season 1, Volume 2",
        "Farscape, Season 1, Volume 3",
        "Farscape, Season 1, Volume 4",
        "Farscape, Season 1, Volume 5",
        "Farscape, Season 1, Volume 6",
        "Farscape, Season 1, Volume 7",
        "Farscape, Season 2, Volume 1",
        "Farscape, Season 2, Volume 2",
        "Farscape, Season 2, Volume 3",
        "Farscape, Season 2, Volume 4",
        "Farscape, Season 2, Volume 5",
        "Farscape, Season 2, Volume 6",
        "Farscape, Season 2, Volume 7",
        "Farscape, Season 2, Volume 8",
        "Farscape, Season 3, Volume 1",
        "Farscape, Season 3, Volume 2",
        "Farscape, Season 3, Volume 3",
        "Farscape, Season 3, Volume 4",
        "Farscape, Season 3, Volume 5",
        "Farscape, Season 3, Volume 6",
        "Farscape, Season 3, Volume 7",
        "Farscape, Season 3, Volume 8",
        "Farscape, Season 4, Volume 1",
        "Farscape, Season 4, Volume 2",
        "Farscape, Season 4, Volume 3",
        "Farscape, Season 4, Volume 4",
        "Farscape, Season 4, Volume 5",
        "Farscape, Season 4, Volume 6",
        "Farscape, Season 4, Volume 7",
        "Farscape, Season 4, Volume 8",
        "Feasting on Asphalt, Season 1",
        "Final Fantasy: The Spirits Within",
        "Finding Nemo",
        "Firefly, Season 1, Extras",
        "Firefly, Season 1, Volume 1",
        "Firefly, Season 1, Volume 2",
        "Firefly, Season 1, Volume 3",
        "Firefly, Season 1, Volume 4",
        "Firefly, Season 1, Volume 5",
        "First Monday in October",
        "Flashdance",
        "Fletch",
        "Fletch Lives",
        "Flushed Away",
        "Flyboys",
        "For Pete's Sake",
        "Forbidden Planet",
        "Foyle's War, Season 1, Disc 1",
        "Foyle's War, Season 1, Disc 2",
        "Foyle's War, Season 1, Disc 3",
        "Foyle's War, Season 1, Disc 4",
        "Foyle's War, Season 2, Disc 1",
        "Foyle's War, Season 2, Disc 1",
        "Foyle's War, Season 2, Disc 2",
        "Foyle's War, Season 2, Disc 2",
        "Foyle's War, Season 2, Disc 3",
        "Foyle's War, Season 2, Disc 3",
        "Foyle's War, Season 2, Disc 4",
        "Foyle's War, Season 2, Disc 4",
        "Foyle's War, Season 2, Disc 4",
        "Frankenstein",
        "Frenzy",
        "From Russia With Love",
        "Frosty Returns",
        "Frosty the Snowman",
        "Full Metal Alchemist: Conqueror of Shamballa",
        "Funny Girl"
      ];

      var sourceObjects = [
        { label: 'bear', value: 'Bear Bibeault'},
        { label: 'yehuda', value: 'Yehuda Katz'},
        { label: 'genius', value: 'Albert Einstein'},
        { label: 'honcho', value: 'Pointy-haired Boss'},
        { label: 'comedian', value: 'Charlie Chaplin'}
      ];

      $(function(){

        $('#labForm').submit(function(){ return false; } );

        $('#applyButton').click(function(){
          $('.testSubject').autocomplete('destroy');
          var options = {};
          $('#valueDisplay').html('&mdash;');
          $.collectOptions(options);
          //
          // special case options
          //
          switch ($('[name="source"]:checked').val()) {
            case 'strings':
              options.source = sourceStrings;
              break;
            case 'objects':
              options.source = sourceObjects;
              break;
            case 'url':
              options.source = '/jqia2/getMovies';
              break;
            case 'callback':
              options.source = function(request,response){
                var term = request.term;
                response(sourceStrings);
              };
              break;
          }
          if ($('#delayValueField').val() != '') options.delay = parseInt($('#delayValueField').val());
          //
          // Display the command
          //
          var command = "$('.testSubject').autocomplete("+$.forDisplay(options)+");";
          $('#commandDisplay').html(command);
          //
          // Register events
          //
          options.search = options.open = options.focus = options.change = options.select = options.close = function(event,info){
            say(event.type + ", " + $.forDisplay(info));
          };
          //
          // Apply
          //
          $('.testSubject').empty().autocomplete(options);
          $('.testSubject')[0].focus();
        });

        $('#disableButton').click(function(){
          $('.testSubject').autocomplete('disable');
          $('#commandDisplay').html("$('.testSubject').autocomplete('disable');");
        });

        $('#enableButton').click(function(){
          $('.testSubject').autocomplete('enable');
          $('#commandDisplay').html("$('.testSubject').autocomplete('enable');");
        });

        $('#enableButton').click(function(){
          $('.testSubject').autocomplete('enable');
          $('#commandDisplay').html("$('.testSubject').autocomplete('enable');");
        });

        $('#labForm').bind('reset',function(){
          $('.testSubject').autocomplete('destroy');
          $('#commandDisplay,#valueDisplay').html('&mdash;');
          $('#console').html('');
        });

        $('[name="animate"]').change(function(){
          $('#animateValueField').attr('disabled',!$('[name="animate"][value="value"]').attr('checked'));
          if ($(this).attr('value') == 'value') $('#animateValueField')[0].focus();
        });

      });

    </script>

    <style>
      #optionsContainer>div {
        float: left;
        width: 400px;
      }
      #buttonBar {
        clear: both;
        padding-top: 12px;
      }
      #column2 input[type=text] {
        width: 32px;
      }
      .testSubjectContainer .body {
        height: 256px;
      }
      #controlPanel label {
        float: left;
        text-align: right;
        width: 9em;
        font-weight: bold;
        margin-right: 6px;
      }
      #column2 label {
        width: 144px;
      }
    </style>
  </head>

  <body class="fancy">

    <div id="pageContainer">
      <div id="pageContent">

        <h1>jQuery UI Autocompleters Lab</h1>

        <div id="controlPanel" data-module="Control Panel">
          <form action="" id="labForm">

            <h3>Autocompleter options</h3>

            <div>
              <label>delay:</label>
              <input type="text" id="delayValueField">
            </div>

            <div>
              <label>minLength:</label>
              <input type="radio" name="minLength" value="" checked="checked" class="radioOption">unspecified
              <input type="radio" name="minLength" value="1" class="radioOption">1
              <input type="radio" name="minLength" value="2" class="radioOption">2
              <input type="radio" name="minLength" value="3" class="radioOption">3
              <input type="radio" name="minLength" value="4" class="radioOption">4
              <input type="radio" name="minLength" value="5" class="radioOption">5
            </div>

            <div>
              <label>source:</label>
              <input type="radio" name="source" value="strings" checked> local string array
              <input type="radio" name="source" value="objects"> local object array
              <input type="radio" name="source" value="url"> URL
              <input type="radio" name="source" value="callback"> callback
            </div>

            <div id="buttonBar">
              <button type="button" id="applyButton" class="green90x24">Apply</button>
              <button type="button" id="disableButton" class="green90x24">Disable</button>
              <button type="button" id="enableButton" class="green90x24">Enable</button>
              <button type="reset" id="resetButton" class="green90x24">Reset</button>
            </div>

          </form>

          <div>
            <h3>Executed commands:</h3>
            <div id="commandDisplay">&mdash;</div>
          </div>
        </div>

        <div id="testSubjectContainer" data-module="Test Subjects">

          <input type="text" class="testSubject"/>

        </div>

        <div id="console" data-module="Console">
        </div>

      </div>
    </div>

  </body>
</html>


