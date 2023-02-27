(* Content-type: application/vnd.wolfram.mathematica *)

(*** Wolfram Notebook File ***)
(* http://www.wolfram.com/nb *)

(* CreatedBy='Mathematica 12.2' *)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       158,          7]
NotebookDataLength[     81014,       2030]
NotebookOptionsPosition[     77773,       1970]
NotebookOutlinePosition[     78265,       1988]
CellTagsIndexPosition[     78222,       1985]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Acceptance-Rejection Method", "Title",
 CellChangeTimes->{{3.830941825774555*^9, 
  3.830941842083791*^9}},ExpressionUUID->"367a7eb0-0f67-4869-8aec-\
c8cbdbf2892c"],

Cell[TextData[StyleBox["Example 1: Exponential Distribution", "Chapter"]], \
"Subtitle",
 CellChangeTimes->{{3.830941845863051*^9, 3.830941907681354*^9}, {
  3.8309440582699547`*^9, 3.8309440607248507`*^9}, {3.830947583969255*^9, 
  3.830947590326392*^9}},ExpressionUUID->"4ecf8d81-9059-4bac-9de6-\
2b6ae62f2b4c"],

Cell[CellGroupData[{

Cell[TextData[StyleBox["SCIMATH202 Project: Spring 2021 \nUniversity College \
Roosevelt\nRobin van den Berg", "Subtitle"]], "Chapter",
 CellChangeTimes->{{3.8309419157724247`*^9, 
  3.8309419514154177`*^9}},ExpressionUUID->"a47d1f07-83af-40fb-a7ad-\
2e71a3cc8ae5"],

Cell[BoxData[{
 RowBox[{"ClearAll", "[", 
  RowBox[{"Evaluate", "[", 
   RowBox[{
    RowBox[{"Context", "[", "]"}], "<>", "\"\<*\>\""}], "]"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "This", " ", "line", " ", "clears", " ", "all", " ", "variables", " ", 
    "previously", " ", "defined", " ", "by", " ", "the", " ", 
    RowBox[{"user", "."}]}], " ", "*)"}]}]}], "Input",
 CellChangeTimes->{{3.8303561257021*^9, 3.830356129426846*^9}, 
   3.8303586015109997`*^9, {3.8303589633793087`*^9, 3.830358968681033*^9}, {
   3.830359153594833*^9, 3.830359154792964*^9}, {3.8303592485871267`*^9, 
   3.830359249641078*^9}, {3.830941810383174*^9, 3.830941811275338*^9}, {
   3.8309419571285563`*^9, 3.8309419997899323`*^9}},
 CellLabel->
  "In[1204]:=",ExpressionUUID->"7ce6b71a-0575-498a-8213-21a7c6430318"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"n", "=", "50000"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "This", " ", "defines", " ", "our", " ", "sample", " ", "size", " ", "for",
     " ", "the", " ", "simulation", " ", 
    RowBox[{
     RowBox[{"(", "N", ")"}], "."}]}], " ", "*)"}]}]}], "Input",
 CellChangeTimes->{
  3.830941814885654*^9, {3.830942002015873*^9, 3.830942018622501*^9}, 
   3.8309420853491373`*^9, {3.8309438309882298`*^9, 3.830943843488303*^9}, {
   3.830960525414341*^9, 3.8309605261769867`*^9}, {3.831145028481791*^9, 
   3.831145052534144*^9}},
 CellLabel->
  "In[1205]:=",ExpressionUUID->"e4b87f10-3ae1-4004-b95e-cc5524b92c96"],

Cell[BoxData["50000"], "Output",
 CellChangeTimes->{
  3.830942635477066*^9, 3.8309427482270193`*^9, 3.830942927023933*^9, 
   3.830943070533802*^9, {3.830943424479383*^9, 3.830943441502067*^9}, {
   3.830943658470169*^9, 3.830943691852084*^9}, {3.830943794266201*^9, 
   3.8309438525700293`*^9}, 3.830943983785852*^9, 3.83094523400917*^9, {
   3.830946472563614*^9, 3.830946479345561*^9}, 3.830946540815959*^9, 
   3.830946707742017*^9, 3.830946816104055*^9, {3.8309468662387867`*^9, 
   3.8309468762496862`*^9}, {3.8309470559660997`*^9, 3.830947060225069*^9}, {
   3.830948430378089*^9, 3.830948446069214*^9}, {3.830948801197936*^9, 
   3.830948812703114*^9}, {3.8309494419270697`*^9, 3.830949478164298*^9}, {
   3.8309497505168657`*^9, 3.8309497557268972`*^9}, 3.8309605312318287`*^9, 
   3.831006546440194*^9, 3.831006714450293*^9, 3.83100709996446*^9, 
   3.831007597487705*^9, {3.831145009182172*^9, 3.831145031960648*^9}, 
   3.831188452627493*^9, 3.831188727251665*^9, 3.831193883252324*^9, 
   3.831193934612905*^9, 3.831193966795923*^9, 3.8311940362410307`*^9, 
   3.831194138362194*^9, 3.831194215502179*^9, {3.8311946694585733`*^9, 
   3.831194698198843*^9}, 3.831194784712834*^9, {3.831194869412684*^9, 
   3.831194912473591*^9}, {3.8311949816463957`*^9, 3.831195015682724*^9}, {
   3.83119508080534*^9, 3.831195143598366*^9}, {3.831195204632848*^9, 
   3.831195231005549*^9}, 3.8311957435312033`*^9, {3.831195892223929*^9, 
   3.831195939224687*^9}, 3.8311964000583277`*^9, 3.831201621681198*^9, 
   3.8312017267413893`*^9, {3.831202008684081*^9, 3.831202023465007*^9}, 
   3.8312020757891493`*^9, 3.831202111908813*^9},
 CellLabel->
  "Out[1205]=",ExpressionUUID->"3af7fd9d-3208-48ea-895f-9f2c23a1aefb"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"c", "=", "8"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "This", " ", "defines", " ", "the", " ", "value", " ", "of", " ", 
    "\"\<c\>\"", " ", "for", " ", "the", " ", "simulation", " ", "that", " ", 
    "we", " ", "calculated", " ", "in", " ", "the", " ", "project", " ", 
    RowBox[{"report", "."}]}], " ", "*)"}]}]}], "Input",
 CellChangeTimes->{{3.830946778302967*^9, 3.830946780308876*^9}, {
  3.831010213874239*^9, 3.831010214169998*^9}, {3.8311938991877728`*^9, 
  3.831193910137209*^9}, {3.831194073071521*^9, 3.8311941034894238`*^9}, {
  3.8311941335812693`*^9, 3.8311941357966557`*^9}, {3.831194865542667*^9, 
  3.831194882641852*^9}, {3.8311957304747343`*^9, 3.831195730847543*^9}},
 CellLabel->
  "In[1206]:=",ExpressionUUID->"4e462c4e-4abd-42dd-a970-57f4e306e208"],

Cell[BoxData["8"], "Output",
 CellChangeTimes->{{3.831145009191333*^9, 3.83114503196863*^9}, 
   3.8311884526346197`*^9, 3.831188727259493*^9, 3.831193883262422*^9, 
   3.831193934624167*^9, 3.831193966806179*^9, 3.831194036264488*^9, {
   3.831194068853002*^9, 3.8311940951815243`*^9}, 3.8311941383736467`*^9, 
   3.8311942155139112`*^9, {3.8311946694681873`*^9, 3.831194698210814*^9}, 
   3.831194784722958*^9, {3.831194869421978*^9, 3.831194912482317*^9}, {
   3.831194981657649*^9, 3.83119501569458*^9}, {3.831195080817151*^9, 
   3.8311951436079283`*^9}, {3.831195204643345*^9, 3.831195231018482*^9}, 
   3.8311957435421762`*^9, {3.8311958922368727`*^9, 3.831195939237711*^9}, 
   3.831196400068376*^9, 3.8312016216915073`*^9, 3.831201726752943*^9, {
   3.831202008697205*^9, 3.8312020234759483`*^9}, 3.83120207579976*^9, 
   3.831202111920323*^9},
 CellLabel->
  "Out[1206]=",ExpressionUUID->"5ed154fa-b099-4577-9613-2f603b449377"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"data", "=", 
   RowBox[{"Table", "[", 
    RowBox[{",", 
     RowBox[{"{", "n", "}"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "This", " ", "creates", " ", "a", " ", "table", " ", "to", " ", "store", 
     " ", "our", " ", "data"}], ",", " ", 
    RowBox[{"called", " ", "\"\<data.\>\""}]}], " ", "*)"}]}]}], "Input",
 CellChangeTimes->{{3.830357220959858*^9, 3.830357250311857*^9}, {
  3.830942021887484*^9, 3.830942055117041*^9}},
 CellLabel->
  "In[1207]:=",ExpressionUUID->"ba0cedf7-2a18-4ddc-b68f-4875e758aa66"],

Cell[BoxData[{
 RowBox[{"Do", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"mylist", "=", 
     RowBox[{"{", "}"}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"u", "=", 
     RowBox[{"RandomVariate", "[", 
      RowBox[{"UniformDistribution", "[", 
       RowBox[{"{", 
        RowBox[{"0", ",", "1"}], "}"}], "]"}], "]"}]}], " ", ";", 
    "\[IndentingNewLine]", 
    RowBox[{"y", "=", 
     RowBox[{"RandomVariate", "[", 
      RowBox[{"UniformDistribution", "[", 
       RowBox[{"{", 
        RowBox[{"0", ",", "8"}], "}"}], "]"}], "]"}]}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{"pair", "=", 
     RowBox[{"{", 
      RowBox[{"u", ",", "y"}], "}"}]}], ";", "\[IndentingNewLine]", 
    RowBox[{"AppendTo", "[", 
     RowBox[{"mylist", ",", "pair"}], "]"}], ";", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"data", "[", 
      RowBox[{"[", "ii", "]"}], "]"}], "=", "mylist"}], ";"}], 
   "\[IndentingNewLine]", ",", 
   RowBox[{"{", 
    RowBox[{"ii", ",", "1", ",", "n"}], "}"}]}], "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "This", " ", "takes", " ", "one", " ", "observation", " ", "from", " ", 
    "the", " ", "Uniform", " ", "Distribution", " ", 
    RowBox[{"(", 
     RowBox[{"0", ",", " ", "1"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{"our", " ", "u"}], ")"}], " ", "and", " ", "one", " ", 
    "observation", " ", "from", " ", "the", " ", "Uniform", " ", 
    "Distribution", " ", 
    RowBox[{"(", 
     RowBox[{"0", ",", " ", "8"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{"our", " ", "y"}], ")"}], " ", "and", " ", "stores", " ", "them",
     " ", "as", " ", "a", " ", "pair", " ", "in", " ", "the", " ", "table", 
    " ", "\"\<data.\>\"", " ", "It", " ", "repeats", " ", "this", " ", 
    "process", " ", "\"\<n\>\"", " ", 
    RowBox[{"times", " ", "."}]}], " ", "*)"}]}]}], "Input",
 CellChangeTimes->{{3.830356486352005*^9, 3.830356511578775*^9}, {
   3.830356573321334*^9, 3.830356614368998*^9}, {3.8303566958134193`*^9, 
   3.83035689637123*^9}, {3.830356987932002*^9, 3.830357069687181*^9}, {
   3.830357105964065*^9, 3.830357106583284*^9}, {3.83035725499382*^9, 
   3.830357291135705*^9}, 3.83035733224607*^9, {3.830359006241967*^9, 
   3.830359007695064*^9}, {3.830942057950742*^9, 3.830942064652739*^9}, {
   3.830942094823202*^9, 3.830942312990728*^9}, {3.830943409003439*^9, 
   3.830943415950198*^9}, {3.830943447777767*^9, 3.830943451853798*^9}, {
   3.830945218605036*^9, 3.8309452187387342`*^9}, {3.830946772889373*^9, 
   3.830946772926174*^9}, {3.830948414900818*^9, 3.83094842540689*^9}, {
   3.83100654035501*^9, 3.831006540486701*^9}, {3.831006704653777*^9, 
   3.831006704995585*^9}, {3.831007165585146*^9, 3.831007169630939*^9}, {
   3.831007564876436*^9, 3.831007569306941*^9}, {3.8310076542455072`*^9, 
   3.831007654299572*^9}, {3.831193963602392*^9, 3.831193982998357*^9}, {
   3.831194885531884*^9, 3.83119490500148*^9}, {3.8312014707337227`*^9, 
   3.831201471427802*^9}},
 CellLabel->
  "In[1208]:=",ExpressionUUID->"146c3a1b-abfc-41a3-8055-63bc660aba86"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"Flatten", "[", 
   RowBox[{"data", ",", "1"}], "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "This", " ", "alters", " ", "the", " ", "format", " ", "of", " ", "the", 
    " ", "table", " ", "so", " ", "that", " ", "it", " ", "is", " ", 
    "suitable", " ", "for", " ", 
    RowBox[{"graphing", "."}]}], " ", "*)"}]}]}], "Input",
 CellChangeTimes->{{3.8303576144550533`*^9, 3.830357619596719*^9}, 
   3.830942034822776*^9, {3.830942318374909*^9, 3.830942363084592*^9}, {
   3.830960624967087*^9, 3.830960625892709*^9}},
 NumberMarks->False,
 CellLabel->
  "In[1209]:=",ExpressionUUID->"f66dcc42-910f-4ce9-a134-3ae65b54a5b9"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"f", "[", "x_", "]"}], ":=", 
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{"-", "x"}]]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "This", " ", "defines", " ", "the", " ", "target", " ", "distribution", 
    " ", "f", 
    RowBox[{"(", "x", ")"}], " ", "from", " ", "which", " ", "we", " ", 
    "want", " ", "to", " ", 
    RowBox[{"sample", "."}]}], " ", "*)"}]}]}], "Input",
 CellChangeTimes->{{3.83035737299833*^9, 3.830357374640974*^9}, {
  3.8303574117274733`*^9, 3.830357411943811*^9}, {3.830357484936364*^9, 
  3.830357485724668*^9}, {3.830358990033124*^9, 3.830359026844595*^9}, {
  3.8303591226470327`*^9, 3.830359126009665*^9}, {3.830942367422689*^9, 
  3.830942384108171*^9}, {3.830945084497485*^9, 3.830945085374506*^9}, {
  3.8309469373299227`*^9, 3.830946937967897*^9}},
 CellLabel->
  "In[1210]:=",ExpressionUUID->"ca84d2da-bf4b-409c-935d-effbf601e430"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"g", "[", "x_", "]"}], ":=", " ", 
    FractionBox["1", 
     RowBox[{"8", "-", "0"}]]}], ";"}], "\[IndentingNewLine]", 
  RowBox[{"(*", " ", 
   RowBox[{
   "This", " ", "defines", " ", "the", " ", "proposal", " ", "distribution", 
    " ", "g", 
    RowBox[{
     RowBox[{"(", "x", ")"}], "."}]}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "This", " ", "is", " ", "also", " ", "the", " ", "distribution", " ", 
    "follwoed", " ", "by", " ", 
    RowBox[{"Y", "."}]}], " ", "*)"}]}]}], "Input",
 CellChangeTimes->{{3.8309467424549007`*^9, 3.830946793269285*^9}, {
   3.8309468306298113`*^9, 3.830946849122738*^9}, 3.830946952273625*^9, {
   3.8310075735801153`*^9, 3.831007573634363*^9}, {3.831145003731551*^9, 
   3.831145003790159*^9}, {3.831193918939096*^9, 3.831193918984742*^9}, {
   3.831201490133479*^9, 3.831201511506885*^9}},
 CellLabel->
  "In[1211]:=",ExpressionUUID->"ad9bc338-aa9c-42f6-999b-00fb57fb2eec"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"accept", "=", 
   RowBox[{"Cases", "[", 
    RowBox[{"data", ",", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"{", 
        RowBox[{"u_", ",", "y_"}], "}"}], "}"}], "/;", " ", 
      RowBox[{"u", "\[LessEqual]", 
       FractionBox[
        RowBox[{"f", "[", "y", "]"}], 
        RowBox[{"c", "*", 
         RowBox[{"g", "[", "y", "]"}]}]]}]}]}], " ", "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "This", " ", "defines", " ", "our", " ", "acceptance", " ", "rejection", 
     " ", "rule", " ", "for", " ", "this", " ", 
     RowBox[{"simulation", ".", " ", "For"}], " ", "each", " ", "pair", " ", 
     "of", " ", "obervations", " ", "in", " ", "\"\<data\>\"", " ", "the", 
     " ", "first", " ", "observation", " ", "is", " ", "called", " ", "u", 
     " ", "and", " ", "the", " ", "second", " ", "observation", " ", "is", 
     " ", "called", " ", 
     RowBox[{"g", ".", " ", "Our"}], " ", "acceptance", " ", "rejection", " ",
      "rule", " ", "is", " ", "to", " ", "accept", " ", "the", " ", "y", " ", 
     "observations", " ", "where", " ", "u"}], " ", "<", " ", 
    RowBox[{
     RowBox[{
      RowBox[{"f", "[", "y", "]"}], "/", "c"}], "*", 
     RowBox[{
      RowBox[{"g", "[", "y", "]"}], "."}]}]}], " ", "*)"}]}]}], "Input",
 CellChangeTimes->{{3.8303574616829767`*^9, 3.8303574681741667`*^9}, {
   3.830358005541032*^9, 3.830358056252286*^9}, {3.8303580958175173`*^9, 
   3.830358144716997*^9}, {3.83035838456312*^9, 3.8303584181871843`*^9}, 
   3.8303584750467453`*^9, 3.830358640142663*^9, {3.8303587612911386`*^9, 
   3.8303587625006123`*^9}, {3.8303591033399363`*^9, 3.830359103722004*^9}, {
   3.8309423863335953`*^9, 3.8309424172587976`*^9}, {3.830943063503443*^9, 
   3.830943065456151*^9}, {3.8309431008742332`*^9, 3.830943172013481*^9}, {
   3.830943653314261*^9, 3.830943654439843*^9}, {3.8309437584987087`*^9, 
   3.830943781947081*^9}, {3.830945069107888*^9, 3.830945070184518*^9}, {
   3.830946462170041*^9, 3.830946462545401*^9}, {3.830946783785069*^9, 
   3.830946805357087*^9}, {3.8309468515874853`*^9, 3.830946851786769*^9}, 
   3.830947040983325*^9, {3.831007086637033*^9, 3.831007087716906*^9}, {
   3.831007325757319*^9, 3.831007327755303*^9}, {3.831007576291321*^9, 
   3.831007588436405*^9}, {3.8310076455341663`*^9, 3.831007647227744*^9}, {
   3.8311939993104153`*^9, 3.8311940007955723`*^9}, {3.831194688091585*^9, 
   3.831194689113415*^9}, {3.831194775766498*^9, 3.831194780413349*^9}, {
   3.831194975397066*^9, 3.8311949785625753`*^9}, {3.8311957363530197`*^9, 
   3.831195741368498*^9}, {3.8312015216190557`*^9, 3.831201533551426*^9}},
 CellLabel->
  "In[1212]:=",ExpressionUUID->"db1022ec-62e3-4d54-a99a-46f0cc838cee"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"acceptedUY", " ", "=", 
   RowBox[{"Flatten", "[", 
    RowBox[{"accept", ",", "1"}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "This", " ", "alters", " ", "the", " ", "format", " ", "of", " ", "the", 
    " ", "list", " ", "of", " ", "accepted", " ", "pairs", " ", "so", " ", 
    "that", " ", "it", " ", "is", " ", "suitable", " ", "for", " ", 
    RowBox[{"graphing", ".", " ", "It"}], " ", "also", " ", "stores", " ", 
    "the", " ", "pairs", " ", "as", " ", "a", " ", "new", " ", 
    RowBox[{"variable", "."}]}], " ", "*)"}]}]}], "Input",
 CellChangeTimes->{{3.830358491826446*^9, 3.830358517403973*^9}, {
   3.830358553071813*^9, 3.830358569237121*^9}, {3.8303586299355717`*^9, 
   3.830358632485367*^9}, {3.8303588700098124`*^9, 3.830358870161755*^9}, {
   3.830942432582314*^9, 3.830942432650724*^9}, {3.8309425293714437`*^9, 
   3.830942581663039*^9}, {3.830942656183805*^9, 3.8309426562281647`*^9}, {
   3.8309427414445133`*^9, 3.8309427415297327`*^9}, 3.8309427755468483`*^9, {
   3.830942826970346*^9, 3.830942827751482*^9}, {3.830942874632482*^9, 
   3.830942883286025*^9}, 3.83094292196845*^9, {3.830943726441284*^9, 
   3.830943728500203*^9}, {3.830949502826034*^9, 3.830949572077635*^9}, {
   3.830960633438221*^9, 3.830960657814465*^9}, {3.831201588431715*^9, 
   3.831201594917815*^9}},
 CellLabel->
  "In[1213]:=",ExpressionUUID->"6edccee5-a215-40df-8ad4-96095ae42164"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"acceptedY", " ", "=", " ", 
   RowBox[{"acceptedUY", "[", 
    RowBox[{"[", 
     RowBox[{"All", ",", "2"}], "]"}], "]"}]}], ";"}], "\[IndentingNewLine]", 

 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "This", " ", "creates", " ", "a", " ", "new", " ", "variable", " ", "that",
     " ", "only", " ", "keeps", " ", "the", " ", "the", " ", "y", " ", "in", 
    " ", "every", " ", "pair", " ", "that", " ", "has", " ", "been", " ", 
    RowBox[{"accepted", "."}]}], " ", "*)"}]}]}], "Input",
 CellChangeTimes->{{3.830942842304665*^9, 3.830942853978263*^9}, 
   3.8309428933113947`*^9, {3.830942969549232*^9, 3.830943003994111*^9}, {
   3.830949434308589*^9, 3.830949484359933*^9}, {3.830949541694936*^9, 
   3.830949610075583*^9}, {3.831007585468169*^9, 3.831007585498109*^9}, {
   3.831007649405406*^9, 3.8310076494517107`*^9}, {3.831201599431538*^9, 
   3.831201606590711*^9}},
 CellLabel->
  "In[1214]:=",ExpressionUUID->"257dd7b9-657b-4dd7-a71f-b8a7bbda6735"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Histogram", "[", "acceptedY", "]"}]], "Input",
 CellChangeTimes->{{3.830943026417544*^9, 3.830943032136855*^9}, {
   3.8309430871700068`*^9, 3.830943095455091*^9}, 3.8309434386636257`*^9, {
   3.8312015531206913`*^9, 3.831201577893693*^9}, 3.831201608831311*^9},
 CellLabel->
  "In[1215]:=",ExpressionUUID->"cfff065c-afde-42a3-a263-dc78ea08598d"],

Cell[BoxData[
 GraphicsBox[{
   {RGBColor[0.987148, 0.8073604000000001, 0.49470040000000004`], EdgeForm[{
    Opacity[0.5389999999999999], Thickness[Small]}], {}, 
    {RGBColor[0.987148, 0.8073604000000001, 0.49470040000000004`], EdgeForm[{
     Opacity[0.5389999999999999], Thickness[Small]}], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{0., 0}, {0.2, 1157.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{31.15832666132906, 
           46.91624728354111}, {-99.62025794657232, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 1157]& ,
        TagBoxNote->"1157"],
       StyleBox["1157", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[1157, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{0.2, 0}, {0.4, 900.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{46.41624728354111, 
           62.174167905753166`}, {-57.00761358073741, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 900]& ,
        TagBoxNote->"900"],
       StyleBox["900", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[900, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{0.4, 0}, {0.6, 780.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{61.674167905753166`, 
           77.43208852796522}, {-37.11065901303239, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 780]& ,
        TagBoxNote->"780"],
       StyleBox["780", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[780, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{0.6, 0}, {0.8, 661.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{76.93208852796522, 
           92.69000915017727}, {-17.37951240005826, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 661]& ,
        TagBoxNote->"661"],
       StyleBox["661", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[661, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{0.8, 0}, {1., 518.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{92.19000915017727, 107.94792977238932`}, {
           6.331025126456879, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 518]& ,
        TagBoxNote->"518"],
       StyleBox["518", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[518, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{1., 0}, {1.2, 407.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{107.44792977238932`, 123.20585039460137`}, {
           24.735708101584024`, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 407]& ,
        TagBoxNote->"407"],
       StyleBox["407", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[407, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{1.2, 0}, {1.4, 313.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{122.70585039460137`, 138.4637710168134}, {
           40.32165584628628, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 313]& ,
        TagBoxNote->"313"],
       StyleBox["313", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[313, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{1.4, 0}, {1.6, 293.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{137.9637710168134, 153.7216916390255}, {
           43.63781494090378, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 293]& ,
        TagBoxNote->"293"],
       StyleBox["293", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[293, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{1.6, 0}, {1.8, 242.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{153.2216916390255, 168.97961226123752`}, {
           52.09402063217841, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 242]& ,
        TagBoxNote->"242"],
       StyleBox["242", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[242, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{1.8, 0}, {2., 190.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{168.47961226123752`, 184.23753288344957`}, {
           60.71603427818392, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 190]& ,
        TagBoxNote->"190"],
       StyleBox["190", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[190, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{2., 0}, {2.2, 168.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{183.73753288344957`, 199.49545350566163`}, {
           64.36380928226318, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 168]& ,
        TagBoxNote->"168"],
       StyleBox["168", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[168, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{2.2, 0}, {2.4, 116.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{198.99545350566163`, 214.75337412787368`}, {
           72.98582292826868, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 116]& ,
        TagBoxNote->"116"],
       StyleBox["116", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[116, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{2.4, 0}, {2.6, 117.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{214.25337412787368`, 230.01129475008574`}, {
           72.82001497353781, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 117]& ,
        TagBoxNote->"117"],
       StyleBox["117", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[117, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{2.6, 0}, {2.8, 90.}, "RoundingRadius" -> 0]},
          ImageSizeCache->{{229.51129475008574`, 245.26921537229777`}, {
           77.29682975127143, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 90]& ,
        TagBoxNote->"90"],
       StyleBox["90", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[90, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{2.8, 0}, {3., 62.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{244.76921537229777`, 260.5271359945098}, {
           81.93945248373593, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 62]& ,
        TagBoxNote->"62"],
       StyleBox["62", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[62, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{3., 0}, {3.2, 57.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{260.0271359945098, 275.78505661672193`}, {
           82.7684922573903, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 57]& ,
        TagBoxNote->"57"],
       StyleBox["57", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[57, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{3.2, 0}, {3.4, 39.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{275.28505661672193`, 291.04297723893393`}, {
           85.75303544254606, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 39]& ,
        TagBoxNote->"39"],
       StyleBox["39", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[39, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{3.4, 0}, {3.6, 37.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{290.54297723893393`, 306.300897861146}, {
           86.08465135200781, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 37]& ,
        TagBoxNote->"37"],
       StyleBox["37", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[37, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{3.6, 0}, {3.8, 30.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{305.800897861146, 321.55881848335804`}, {
           87.24530703512394, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 30]& ,
        TagBoxNote->"30"],
       StyleBox["30", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[30, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{3.8, 0}, {4., 16.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{321.05881848335804`, 336.8167391055701}, {
           89.5666184013562, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 16]& ,
        TagBoxNote->"16"],
       StyleBox["16", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[16, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{4., 0}, {4.2, 21.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{336.3167391055701, 352.07465972778215`}, {
           88.73757862770181, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 21]& ,
        TagBoxNote->"21"],
       StyleBox["21", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[21, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{4.2, 0}, {4.4, 20.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{351.57465972778215`, 367.3325803499942}, {
           88.90338658243269, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 20]& ,
        TagBoxNote->"20"],
       StyleBox["20", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[20, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{4.4, 0}, {4.6, 16.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{366.8325803499942, 382.5905009722062}, {
           89.5666184013562, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 16]& ,
        TagBoxNote->"16"],
       StyleBox["16", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[16, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{4.6, 0}, {4.8, 12.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{382.0905009722062, 397.8484215944183}, {
           90.22985022027969, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 12]& ,
        TagBoxNote->"12"],
       StyleBox["12", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[12, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{4.8, 0}, {5., 7.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{397.3484215944183, 413.10634221663037`}, {
           91.05888999393406, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 7]& ,
        TagBoxNote->"7"],
       StyleBox["7", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[7, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{5., 0}, {5.2, 9.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{412.60634221663037`, 428.3642628388424}, {
           90.72727408447231, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 9]& ,
        TagBoxNote->"9"],
       StyleBox["9", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[9, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{5.2, 0}, {5.4, 6.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{427.8642628388424, 443.6221834610545}, {
           91.22469794866494, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 6]& ,
        TagBoxNote->"6"],
       StyleBox["6", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[6, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{5.4, 0}, {5.6, 5.}, "RoundingRadius" -> 0]},
          ImageSizeCache->{{443.1221834610545, 458.8801040832665}, {
           91.39050590339582, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 5]& ,
        TagBoxNote->"5"],
       StyleBox["5", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[5, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{5.6, 0}, {5.8, 3.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{458.3801040832665, 474.13802470547853`}, {
           91.72212181285757, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 3]& ,
        TagBoxNote->"3"],
       StyleBox["3", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[3, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{5.8, 0}, {6., 6.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{473.63802470547853`, 489.3959453276906}, {
           91.22469794866494, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 6]& ,
        TagBoxNote->"6"],
       StyleBox["6", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[6, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{6., 0}, {6.2, 3.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{488.8959453276906, 504.6538659499027}, {
           91.72212181285757, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 3]& ,
        TagBoxNote->"3"],
       StyleBox["3", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[3, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{6.2, 0}, {6.4, 4.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{504.1538659499027, 519.9117865721148}, {
           91.55631385812669, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 4]& ,
        TagBoxNote->"4"],
       StyleBox["4", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[4, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{6.4, 0}, {6.6, 3.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{519.4117865721148, 535.1697071943267}, {
           91.72212181285757, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 3]& ,
        TagBoxNote->"3"],
       StyleBox["3", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[3, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{6.6, 0}, {6.8, 1.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{534.6697071943267, 550.4276278165388}, {
           92.05373772231931, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 1]& ,
        TagBoxNote->"1"],
       StyleBox["1", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[1, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{6.8, 0}, {7., 1.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{549.9276278165388, 565.6855484387509}, {
           92.05373772231931, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 1]& ,
        TagBoxNote->"1"],
       StyleBox["1", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[1, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{7.6, 0}, {7.8, 2.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{610.959310305387, 626.7172309275991}, {
           91.88792976758845, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 2]& ,
        TagBoxNote->"2"],
       StyleBox["2", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[2, {}], "Tooltip"]& ], 
     TagBox[
      TooltipBox[
       TagBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           RectangleBox[{7.8, 0}, {8., 1.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{626.2172309275991, 641.9751515498111}, {
           92.05373772231931, 92.71954567705019}}],
         "DelayedMouseEffectStyle"],
        StatusArea[#, 1]& ,
        TagBoxNote->"1"],
       StyleBox["1", {}, StripOnInput -> False]],
      Annotation[#, 
       Style[1, {}], 
       "Tooltip"]& ]}, {}, {}}, {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, \
{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, \
{}, {}, {}, {}, {}, {}, {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{-0.084, 0},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  PlotRange->NCache[{{0, 
      Rational[21, 5]}, {All, All}}, {{0, 4.2}, {All, All}}],
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output",
 CellChangeTimes->{
  3.830943036636147*^9, {3.8309430710038757`*^9, 3.8309430959014063`*^9}, {
   3.830943424811667*^9, 3.830943441853197*^9}, {3.830943658797968*^9, 
   3.8309436921927032`*^9}, {3.8309437946186543`*^9, 3.8309438533694077`*^9}, 
   3.8309439845693703`*^9, 3.8309452347719183`*^9, {3.8309464734621696`*^9, 
   3.8309464801770363`*^9}, 3.8309465417525797`*^9, 3.830946708556566*^9, 
   3.830946817242104*^9, {3.8309468671829643`*^9, 3.8309468771610126`*^9}, {
   3.830947056932754*^9, 3.830947061126409*^9}, {3.830948431555859*^9, 
   3.83094844735563*^9}, {3.830948802456792*^9, 3.83094881400419*^9}, {
   3.830949443210273*^9, 3.8309494795479813`*^9}, {3.830949751847851*^9, 
   3.8309497569920053`*^9}, 3.8309605363800163`*^9, 3.831006550961411*^9, 
   3.831006719175214*^9, 3.831007105035833*^9, 3.831007602592141*^9, {
   3.831145012952138*^9, 3.831145046375128*^9}, 3.831188456474861*^9, 
   3.831188731061891*^9, 3.831193887155444*^9, 3.831193938610362*^9, 
   3.8311939715036793`*^9, 3.8311940403967457`*^9, 3.83119414345745*^9, 
   3.831194220240921*^9, {3.831194674274907*^9, 3.831194703172501*^9}, 
   3.831194789577876*^9, {3.831194874625813*^9, 3.831194916296735*^9}, {
   3.8311949860527887`*^9, 3.83119502046502*^9}, {3.831195085365239*^9, 
   3.831195148405354*^9}, {3.831195209497851*^9, 3.831195235970834*^9}, 
   3.831195748658082*^9, {3.83119589730891*^9, 3.831195944851273*^9}, 
   3.8311964056417427`*^9, 3.83120162680084*^9, 3.831201731848049*^9, {
   3.83120201388465*^9, 3.831202028405294*^9}, 3.831202080925776*^9, 
   3.8312021168636303`*^9},
 CellLabel->
  "Out[1215]=",ExpressionUUID->"72f2ea6d-c419-4ef5-91b5-4f8d67f79479"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"f", "[", "x", "]"}], ",", 
   RowBox[{"{", 
    RowBox[{"x", ",", "0", ",", "10"}], "}"}], ",", 
   RowBox[{"PlotLabel", "\[Rule]", "\"\<X \[Tilde] EXP(1)\>\""}], ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{"\"\<x\>\"", ",", "\"\<f[x]\>\""}], "}"}]}]}], "]"}]], "Input",
 CellChangeTimes->{{3.830943972650564*^9, 3.830943973321394*^9}, {
   3.831188326473424*^9, 3.8311883522367887`*^9}, {3.8311883850205812`*^9, 
   3.831188389524159*^9}, 3.831188466715601*^9, {3.8311885296126423`*^9, 
   3.831188554787414*^9}, {3.8311885948111477`*^9, 3.831188640783771*^9}, {
   3.831188674016189*^9, 3.831188677957609*^9}, {3.831188718391303*^9, 
   3.831188718811941*^9}, {3.831188764477222*^9, 3.83118876472182*^9}, {
   3.831191619997385*^9, 3.8311916692633953`*^9}},
 CellLabel->
  "In[1216]:=",ExpressionUUID->"e0a68e4f-544c-42cf-8a27-1fc8341f2f6b"],

Cell[BoxData[
 GraphicsBox[{{{}, {}, 
    TagBox[
     {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
      1.], LineBox[CompressedData["
1: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
Nckc3LsV/gfWPBqM
       "]]},
     Annotation[#, "Charting`Private`Tag$129248#1"]& ]}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"x\"", TraditionalForm], 
    FormBox["\"f[x]\"", TraditionalForm]},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImagePadding->All,
  Method->{
   "DefaultBoundaryStyle" -> Automatic, 
    "DefaultGraphicsInteraction" -> {
     "Version" -> 1.2, "TrackMousePosition" -> {True, False}, 
      "Effects" -> {
       "Highlight" -> {"ratio" -> 2}, "HighlightPoint" -> {"ratio" -> 2}, 
        "Droplines" -> {
         "freeformCursorMode" -> True, 
          "placement" -> {"x" -> "All", "y" -> "None"}}}}, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None, 
    "CoordinatesToolOptions" -> {"DisplayFunction" -> ({
        (Identity[#]& )[
         Part[#, 1]], 
        (Identity[#]& )[
         Part[#, 2]]}& ), "CopiedValueFunction" -> ({
        (Identity[#]& )[
         Part[#, 1]], 
        (Identity[#]& )[
         Part[#, 2]]}& )}},
  PlotLabel->FormBox["\"X \[Tilde] EXP(1)\"", TraditionalForm],
  PlotRange->{{0, 10}, {0., 0.4241074129009191}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output",
 CellChangeTimes->{{3.8309439754704227`*^9, 3.830943984641206*^9}, 
   3.8309452348134108`*^9, {3.830946473545508*^9, 3.830946480238719*^9}, 
   3.8309465418203087`*^9, 3.8309467086271963`*^9, 3.830946817284329*^9, {
   3.830946867267249*^9, 3.830946877223339*^9}, {3.830947057018447*^9, 
   3.830947061188184*^9}, {3.8309484316047792`*^9, 3.830948447417119*^9}, {
   3.830948802514344*^9, 3.830948814055999*^9}, {3.830949443259186*^9, 
   3.830949479599395*^9}, {3.830949751899687*^9, 3.83094975704366*^9}, 
   3.830960536436062*^9, 3.831006551015016*^9, 3.831006719227961*^9, 
   3.831007105087782*^9, 3.831007602651095*^9, {3.8311450129987392`*^9, 
   3.831145046427006*^9}, 3.831188328039165*^9, 3.831188391557582*^9, 
   3.831188456531479*^9, 3.8311885562712297`*^9, {3.831188653035763*^9, 
   3.831188731119706*^9}, 3.831188765149482*^9, {3.831191628808589*^9, 
   3.8311916714981327`*^9}, 3.831193887205988*^9, 3.8311939386613493`*^9, 
   3.831193971560522*^9, 3.8311940404610043`*^9, 3.831194143528831*^9, 
   3.8311942202980623`*^9, {3.8311946743382273`*^9, 3.831194703230145*^9}, 
   3.831194789634858*^9, {3.831194874683588*^9, 3.8311949163620377`*^9}, {
   3.831194986101198*^9, 3.831195020524372*^9}, {3.831195085417161*^9, 
   3.831195148461556*^9}, {3.8311952095585003`*^9, 3.8311952360336523`*^9}, 
   3.831195748723435*^9, {3.831195897381559*^9, 3.831195944914016*^9}, 
   3.831196405713767*^9, 3.831201626863741*^9, 3.831201731909587*^9, {
   3.831202013941575*^9, 3.831202028471425*^9}, 3.83120208098976*^9, 
   3.831202116913912*^9},
 CellLabel->
  "Out[1216]=",ExpressionUUID->"30d7b00b-e98b-4a0e-a479-96aad310ed41"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"p1", "=", 
   RowBox[{"Histogram", "[", 
    RowBox[{"acceptedY", ",", 
     RowBox[{"{", 
      RowBox[{"0", ",", "8", ",", "0.5"}], "}"}], ",", 
     "\"\<Probability\>\""}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"p2", "=", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{
      FractionBox["1", "2"], 
      RowBox[{"f", "[", "x", "]"}]}], ",", 
     RowBox[{"{", 
      RowBox[{"x", ",", "0", ",", "8"}], "}"}]}], "]"}]}], ";"}]}], "Input",
 CellChangeTimes->{{3.830949613986327*^9, 3.830949621307746*^9}, {
   3.830949665372532*^9, 3.830949698986912*^9}, {3.830949736047002*^9, 
   3.83094973731982*^9}, {3.83094977924721*^9, 3.8309498559704227`*^9}, {
   3.830949935534149*^9, 3.830949978926647*^9}, {3.8309506395939703`*^9, 
   3.830950664793413*^9}, {3.8309605421288967`*^9, 3.830960550383894*^9}, {
   3.8310066107102337`*^9, 3.831006623933153*^9}, {3.831006723051876*^9, 
   3.8310067323565273`*^9}, {3.831195076438517*^9, 3.83119514074023*^9}, {
   3.831195217004334*^9, 3.831195228894909*^9}, {3.831195899160757*^9, 
   3.831195936901738*^9}, {3.8311963967089663`*^9, 3.8311964231717243`*^9}, {
   3.83119649133667*^9, 3.831196492383584*^9}, 3.831201613669894*^9, {
   3.8312019933000727`*^9, 3.831202035838511*^9}, {3.831202106930595*^9, 
   3.8312021093278427`*^9}},
 CellLabel->
  "In[1217]:=",ExpressionUUID->"2a684458-e703-4bbd-be75-55eb18ddb15d"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Show", "[", 
  RowBox[{"p1", ",", "p2", ",", 
   RowBox[{
   "PlotLabel", "\[Rule]", " ", 
    "\"\<Accepted \!\(\*SubscriptBox[\(y\), \(i\)]\) and \
f(x)=\!\(\*SuperscriptBox[\(e\), \(-x\)]\)\>\""}], ",", " ", 
   RowBox[{"AxesLabel", "\[Rule]", " ", 
    RowBox[{"{", 
     RowBox[{"\"\<x\>\"", ",", " ", "\"\<Probability / f(x)\>\""}], "}"}]}], 
   ",", " ", 
   RowBox[{"PlotLegends", "\[Rule]", " ", 
    RowBox[{"{", "\"\<f(x)\>\"", "}"}]}]}], "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "This", " ", "plots", " ", "our", " ", "accepted", " ", "y", " ", 
    "against", " ", "the", " ", "pdf", " ", "of", " ", "an", " ", 
    "exponential", " ", "distribution", " ", "with", " ", "a", " ", "rate", 
    " ", "parameter", " ", "of", " ", "1", " ", "to", " ", "ensure", " ", 
    "that", " ", "the", " ", "accpted", " ", "y", " ", "follow", " ", "the", 
    " ", "desired", " ", 
    RowBox[{"distribution", "."}]}], " ", "*)"}]}]}], "Input",
 CellChangeTimes->{{3.83119649524972*^9, 3.831196642631731*^9}, {
  3.831199398835401*^9, 3.831199404100039*^9}, {3.831199436690028*^9, 
  3.831199473470511*^9}, {3.831199523632266*^9, 3.831199568521703*^9}, {
  3.831199607090609*^9, 3.831199652094805*^9}, {3.83119977210736*^9, 
  3.831199795467856*^9}, {3.831201649041795*^9, 3.831201715868799*^9}},
 CellLabel->
  "In[1219]:=",ExpressionUUID->"a1a26122-a90f-4024-a8e4-04a08c97ea1b"],

Cell[BoxData[
 GraphicsBox[{{
    {RGBColor[0.987148, 0.8073604000000001, 0.49470040000000004`], EdgeForm[{
     Opacity[0.574], Thickness[Small]}], {}, 
     {RGBColor[0.987148, 0.8073604000000001, 0.49470040000000004`], EdgeForm[{
      Opacity[0.574], Thickness[Small]}], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{0., 0}, {0.5, 0.39204815460161574`}, 
             "RoundingRadius" -> 0]},
           
           ImageSizeCache->{{40.72598078462771, 
            59.900920736589285`}, {-78.63187697652037, 100.76521126020111`}}],
          
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.39204815460161574`]& ,
         TagBoxNote->"0.39204815460161574"],
        StyleBox["0.39204815460161574`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.39204815460161574`, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{0.5, 0}, {1., 0.2440994772691272}, "RoundingRadius" -> 
             0]},
           
           ImageSizeCache->{{59.400920736589285`, 
            78.57586068855085}, {-11.120814183349509`, 100.76521126020111`}}],
          
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.2440994772691272]& ,
         TagBoxNote->"0.2440994772691272"],
        StyleBox["0.2440994772691272`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.2440994772691272, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{1., 0}, {1.5, 0.1389196895295422}, "RoundingRadius" -> 
             0]},
           
           ImageSizeCache->{{78.07586068855085, 97.25080064051242}, {
            36.874202620360826`, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.1389196895295422]& ,
         TagBoxNote->"0.1389196895295422"],
        StyleBox["0.1389196895295422`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.1389196895295422, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{1.5, 0}, {2., 0.08997307143988595}, 
             "RoundingRadius" -> 0]},
           
           ImageSizeCache->{{96.75080064051242, 115.925740592474}, {
            59.2092330305212, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.08997307143988595]& ,
         TagBoxNote->"0.08997307143988595"],
        StyleBox["0.08997307143988595`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.08997307143988595, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{2., 0}, {2.5, 0.053540313638523684`}, 
             "RoundingRadius" -> 0]},
           ImageSizeCache->{{115.425740592474, 134.6006805444356}, {
            75.83401294746905, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.053540313638523684`]& ,
         TagBoxNote->"0.053540313638523684"],
        StyleBox["0.053540313638523684`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.053540313638523684`, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{2.5, 0}, {3., 0.03405670837953429}, 
             "RoundingRadius" -> 0]},
           
           ImageSizeCache->{{134.1006805444356, 153.27562049639715`}, {
            84.72465612044552, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.03405670837953429]& ,
         TagBoxNote->"0.03405670837953429"],
        StyleBox["0.03405670837953429`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.03405670837953429, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{3., 0}, {3.5, 0.018691588785046728`}, 
             "RoundingRadius" -> 0]},
           
           ImageSizeCache->{{152.77562049639715`, 171.95056044835871`}, {
            91.73597634628874, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.018691588785046728`]& ,
         TagBoxNote->"0.018691588785046728"],
        StyleBox["0.018691588785046728`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.018691588785046728`, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{3.5, 0}, {4., 0.009662600982100427}, 
             "RoundingRadius" -> 0]},
           
           ImageSizeCache->{{171.45056044835871`, 190.62550040032028`}, {
            95.8560304996193, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.009662600982100427]& ,
         TagBoxNote->"0.009662600982100427"],
        StyleBox["0.009662600982100427`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.009662600982100427, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{4., 0}, {4.5, 0.007603358149849517}, 
             "RoundingRadius" -> 0]},
           
           ImageSizeCache->{{190.12550040032028`, 209.30044035228184`}, {
            96.79569197318591, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.007603358149849517]& ,
         TagBoxNote->"0.007603358149849517"],
        StyleBox["0.007603358149849517`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.007603358149849517, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{4.5, 0}, {5., 0.004435292254078885}, 
             "RoundingRadius" -> 0]},
           
           ImageSizeCache->{{208.80044035228184`, 227.97538030424346`}, {
            98.24132500944225, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.004435292254078885]& ,
         TagBoxNote->"0.004435292254078885"],
        StyleBox["0.004435292254078885`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.004435292254078885, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{5., 0}, {5.5, 0.002851259306193569}, 
             "RoundingRadius" -> 0]},
           
           ImageSizeCache->{{227.47538030424346`, 246.65032025620502`}, {
            98.9641415275704, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.002851259306193569]& ,
         TagBoxNote->"0.002851259306193569"],
        StyleBox["0.002851259306193569`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.002851259306193569, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{5.5, 0}, {6., 0.0017424362426738476`}, 
             "RoundingRadius" -> 0]},
           
           ImageSizeCache->{{246.15032025620502`, 265.3252602081666}, {
            99.47011309026013, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.0017424362426738476`]& ,
         TagBoxNote->"0.0017424362426738476"],
        StyleBox["0.0017424362426738476`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.0017424362426738476`, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{6., 0}, {6.5, 0.0012672263583082528`}, 
             "RoundingRadius" -> 0]},
           
           ImageSizeCache->{{264.8252602081666, 284.00020016012814`}, {
            99.68695804569857, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.0012672263583082528`]& ,
         TagBoxNote->"0.0012672263583082528"],
        StyleBox["0.0012672263583082528`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.0012672263583082528`, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{6.5, 0}, {7., 0.0006336131791541264}, 
             "RoundingRadius" -> 0]},
           
           ImageSizeCache->{{283.50020016012814`, 302.67514011208976`}, {
            99.97608465294985, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.0006336131791541264]& ,
         TagBoxNote->"0.0006336131791541264"],
        StyleBox["0.0006336131791541264`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.0006336131791541264, {}], "Tooltip"]& ], 
      TagBox[
       TooltipBox[
        TagBox[
         TagBox[
          DynamicBox[{
            FEPrivate`If[
             CurrentValue["MouseOver"], 
             EdgeForm[{
               GrayLevel[0.5], 
               AbsoluteThickness[1.5], 
               Opacity[0.66]}], {}, {}], 
            
            RectangleBox[{7.5, 0}, {8., 0.0004752098843655948}, 
             "RoundingRadius" -> 0]},
           
           ImageSizeCache->{{320.8500800640513, 340.0250200160129}, {
            100.04836630476267`, 100.76521126020111`}}],
          "DelayedMouseEffectStyle"],
         StatusArea[#, 0.0004752098843655948]& ,
         TagBoxNote->"0.0004752098843655948"],
        StyleBox["0.0004752098843655948`", {}, StripOnInput -> False]],
       Annotation[#, 
        Style[0.0004752098843655948, {}], 
        "Tooltip"]& ]}, {}, {}}, {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, \
{}, {}, {}, {}}}, {{{}, {}, 
     TagBox[
      {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], 
       Opacity[1.], LineBox[CompressedData["
1:eJwBQQS++yFib1JlAgAAAEMAAAACAAAA9IVsVCK35j/xyHv3n5PPP3fOOT+Y
9Ok/wyP8L3xwzD8XtBHeAQHvP4hkZ37mScg/tuJDzM888j9Mps36t3jEP8Jq
nRtZ7PQ/fstKzuZOwT/1Jj0PrW33P7EtM+Vxmb0/AvmrEBsl+j/Q8SGdNvq4
Pzb/YLZTrvw/r3Z0IvZQtT/MhDTOxir/P5jdMFWiP7I/H5Dr+anuAEBK5jou
stWuP+v3397VMAJASquPUa5Yqj+k6rvKDo4DQARgRZFMN6Y/Dh2n7+TkBEC/
w3WeqcqiP4xptWagJAZAI+vyz1AToD/2QKvkaH8HQM9VJluQJJs/dDLEtBbD
CEDRW9AywSyXP9+uxIvRIQpAx9HEzfqGkz/7atSbKXoLQJD2DTZUgZA/K0EH
/ma7DEDF/8s72zeMP0eiIWexFw5AEFFn6B/Ohz93HV8i4VwPQIOLwatlT4Q/
LOxVC9dNEEBMlbSl4mGBPxMP8AjE+hBAZhp/ReRcfT8Ev5uvI5wRQPuxkkrr
FHk/azS72QlLEkDji3OwxSR1P6tJYqC+9hJAaAt6/CnhcT/16xoQ5pYTQAsl
7w/vlG4/tVNHA5REFECmz6RzlM9pP39IhZ+05hRA+rlheQgIZj8h3UrYo4UV
QHdqec0y3WI/OjeElBkyFkArhVoKWuFfP1wez/kB0xZAC0EBlZY+Wz/1yo3i
cIEXQAT8Umov+lY/mARedFIkGEAJv6jXKZlTPxPetaICxBhAWEJ71LbEUD8F
fYFUOXEZQCcvJcJaUUw/AKler+ISGkC04qb+pS5IP3Kar40SwhpANYZ1cDBh
RD+9K4gIEW4bQFQfr8iIOkE/EUpyLIIOHEDqdXvazXU9P9wt0NN5vBxAkzux
WXTbOD+wnj8k5F4dQDzTF8UgNjU/Xa82ER3+HUDORQTDKSgyP4CFoYHcqh5A
UjY+iTGtLj+t6B2bDkwfQKSMbnpaNSo/iJ2FYN5OH0CkOqru9CIqP2RS7SWu
UR9At1W0TJwQKj8cvLywTVcfQK5P+KER7Ck/io9bxoxiH0DzDgK1laMpP2g2
mfEKeR9A1/7Vr/sUKT8ihBRIB6YfQJXM8dIBASg//jh8DdeoH0BAGO9pKPAn
P9nt49Kmqx9A6NCq1FrfJz+QV7NdRrEfQHI3LgTjvSc//ypSc4W8H0AQD1/k
f3snP9zRj54D0x9AxpEhhOT4Jj+4hvdj09UfQD2/bX/E6CY/lDtfKaPYH0Cb
L1bMr9gmP0ulLrRC3h9AIqk5O6i4Jj+6eM3JgekfQPAjM5AfeSY/li01j1Hs
H0DpTCI7WWkmP3HinFQh7x9Apn65+J1ZJj8oTGzfwPQfQLVvzoxIOiY/BAHU
pJD3H0CWCNFTriomP+C1O2pg+h9Ar1WFDh8bJj+8aqMvMP0fQHRSO7WaCyY/
lx8L9f//H0DQX0hAIfwlP0sY4vQ=
        "]]},
      Annotation[#, "Charting`Private`Tag$129366#1"]& ]}, {}}},
  PlotLegends -> {"f(x)"},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"x\"", TraditionalForm], 
    FormBox["\"Probability / f(x)\"", TraditionalForm]},
  AxesOrigin->{-0.16, 0},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  PlotLabel->FormBox[
   "\"Accepted \\!\\(\\*SubscriptBox[\\(y\\), \\(i\\)]\\) and \
f(x)=\\!\\(\\*SuperscriptBox[\\(e\\), \\(-x\\)]\\)\"", TraditionalForm],
  PlotRange->{{0., 8.}, {All, All}},
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output",
 CellChangeTimes->{
  3.8311995531495647`*^9, 3.8311995932175007`*^9, {3.831199627562886*^9, 
   3.831199652946556*^9}, {3.831199774647382*^9, 3.831199795846941*^9}, 
   3.831201627106502*^9, 3.831201731993507*^9, {3.831202014055387*^9, 
   3.831202028579136*^9}, 3.8312020810896893`*^9, 3.8312021170195913`*^9},
 CellLabel->
  "Out[1219]=",ExpressionUUID->"086a209b-b5bf-4b50-8be2-4b56eaa3a387"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Export", "[", 
  RowBox[{"\"\<ARM1\>\"", ",", "%1035", ",", "\"\<JPEG\>\""}], "]"}]], "Input",\

 CellChangeTimes->{{3.8311998352302523`*^9, 3.831199851083864*^9}, 
   3.8311998849394627`*^9},
 NumberMarks->False,
 CellLabel->
  "In[1220]:=",ExpressionUUID->"f7863986-e131-4178-9f68-08b489a3d652"],

Cell[BoxData["\<\"ARM1\"\>"], "Output",
 CellChangeTimes->{
  3.831199886572047*^9, 3.8312016272903137`*^9, 3.831201732188127*^9, {
   3.831202014239843*^9, 3.8312020287646313`*^9}, 3.8312020812760878`*^9, 
   3.831202117213223*^9},
 CellLabel->
  "Out[1220]=",ExpressionUUID->"db73400a-ac6d-447c-9b10-7b26062dad5b"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData["\"\<ARM1\>\""], "Input",
 CellChangeTimes->{{3.831199882210875*^9, 3.8311998822149363`*^9}},
 CellLabel->
  "In[1221]:=",ExpressionUUID->"0de4b96b-43ec-4020-8bb3-636bc7d39301"],

Cell[BoxData["\<\"ARM1\"\>"], "Output",
 CellChangeTimes->{
  3.831201627303627*^9, 3.8312017322021637`*^9, {3.8312020142533712`*^9, 
   3.831202028777474*^9}, 3.831202081289797*^9, 3.83120211722762*^9},
 CellLabel->
  "Out[1221]=",ExpressionUUID->"f5836e73-3e3c-4c65-a509-994b491ce164"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{718, 672},
WindowMargins->{{221, Automatic}, {Automatic, 29}},
TaggingRules->{
 "WelcomeScreenSettings" -> {"FEStarting" -> False}, "TryRealOnly" -> False},
FrontEndVersion->"12.2 for Mac OS X x86 (64-bit) (December 12, 2020)",
StyleDefinitions->"Default.nb",
ExpressionUUID->"16d22410-2b2d-4e45-ad79-9d6df6395d3b"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[580, 22, 170, 3, 98, "Title",ExpressionUUID->"367a7eb0-0f67-4869-8aec-c8cbdbf2892c"],
Cell[753, 27, 313, 5, 66, "Subtitle",ExpressionUUID->"4ecf8d81-9059-4bac-9de6-2b6ae62f2b4c"],
Cell[CellGroupData[{
Cell[1091, 36, 265, 4, 126, "Chapter",ExpressionUUID->"a47d1f07-83af-40fb-a7ad-2e71a3cc8ae5"],
Cell[1359, 42, 841, 18, 52, "Input",ExpressionUUID->"7ce6b71a-0575-498a-8213-21a7c6430318"],
Cell[CellGroupData[{
Cell[2225, 64, 664, 15, 52, "Input",ExpressionUUID->"e4b87f10-3ae1-4004-b95e-cc5524b92c96"],
Cell[2892, 81, 1718, 25, 34, "Output",ExpressionUUID->"3af7fd9d-3208-48ea-895f-9f2c23a1aefb"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4647, 111, 836, 15, 73, "Input",ExpressionUUID->"4e462c4e-4abd-42dd-a970-57f4e306e208"],
Cell[5486, 128, 937, 14, 34, "Output",ExpressionUUID->"5ed154fa-b099-4577-9613-2f603b449377"]
}, Open  ]],
Cell[6438, 145, 615, 16, 73, "Input",ExpressionUUID->"ba0cedf7-2a18-4ddc-b68f-4875e758aa66"],
Cell[7056, 163, 3078, 65, 262, "Input",ExpressionUUID->"146c3a1b-abfc-41a3-8055-63bc660aba86"],
Cell[10137, 230, 699, 16, 73, "Input",ExpressionUUID->"f66dcc42-910f-4ce9-a134-3ae65b54a5b9"],
Cell[10839, 248, 958, 21, 73, "Input",ExpressionUUID->"ca84d2da-bf4b-409c-935d-effbf601e430"],
Cell[11800, 271, 1025, 25, 92, "Input",ExpressionUUID->"ad9bc338-aa9c-42f6-999b-00fb57fb2eec"],
Cell[12828, 298, 2766, 53, 158, "Input",ExpressionUUID->"db1022ec-62e3-4d54-a99a-46f0cc838cee"],
Cell[15597, 353, 1471, 26, 94, "Input",ExpressionUUID->"6edccee5-a215-40df-8ad4-96095ae42164"],
Cell[17071, 381, 999, 21, 73, "Input",ExpressionUUID->"257dd7b9-657b-4dd7-a71f-b8a7bbda6735"],
Cell[CellGroupData[{
Cell[18095, 406, 370, 6, 30, "Input",ExpressionUUID->"cfff065c-afde-42a3-a263-dc78ea08598d"],
Cell[18468, 414, 28225, 825, 239, "Output",ExpressionUUID->"72f2ea6d-c419-4ef5-91b5-4f8d67f79479"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46730, 1244, 932, 18, 30, "Input",ExpressionUUID->"e0a68e4f-544c-42cf-8a27-1fc8341f2f6b"],
Cell[47665, 1264, 10243, 185, 264, "Output",ExpressionUUID->"30d7b00b-e98b-4a0e-a479-96aad310ed41"]
}, Open  ]],
Cell[57923, 1452, 1426, 30, 68, "Input",ExpressionUUID->"2a684458-e703-4bbd-be75-55eb18ddb15d"],
Cell[CellGroupData[{
Cell[59374, 1486, 1441, 29, 119, "Input",ExpressionUUID->"a1a26122-a90f-4024-a8e4-04a08c97ea1b"],
Cell[60818, 1517, 15721, 412, 258, "Output",ExpressionUUID->"086a209b-b5bf-4b50-8be2-4b56eaa3a387"]
}, Open  ]],
Cell[CellGroupData[{
Cell[76576, 1934, 321, 8, 30, "Input",ExpressionUUID->"f7863986-e131-4178-9f68-08b489a3d652"],
Cell[76900, 1944, 316, 6, 34, "Output",ExpressionUUID->"db73400a-ac6d-447c-9b10-7b26062dad5b"]
}, Open  ]],
Cell[CellGroupData[{
Cell[77253, 1955, 190, 3, 30, InheritFromParent,ExpressionUUID->"0de4b96b-43ec-4020-8bb3-636bc7d39301"],
Cell[77446, 1960, 287, 5, 82, "Output",ExpressionUUID->"f5836e73-3e3c-4c65-a509-994b491ce164"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

