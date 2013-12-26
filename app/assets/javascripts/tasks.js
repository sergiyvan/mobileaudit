
/// выводим номера шагов(пересчет нужен при удалении/добавлении какой-либо подзадачи(шага) )
function taskStepNumerize(){
  var domSteps = document.getElementById('task_steps').getElementsByClassName('task_step'), key = -1, max = domSteps.length, domNumer;
  while(++key<max){
    domNumer = domSteps[key].getElementsByClassName('task_numer')[0];
    domNumer.innerHTML = domNumer.innerHTML.replace( RegExp('\\d+$'), key+1 );
  }
  var domStepsCount = document.getElementById('task_steps').getElementsByClassName('task_steps_count')[0];
  domStepsCount.innerHTML = domStepsCount.innerHTML.replace( RegExp('\\d+'), max );
};

/// скрывает поле предопределенных ответов, если тип задачи изменен на другой
function taskTypeTurn( dom ){
  var domStep = dom.parentNode.parentNode;
  var domAnswerS = domStep.getElementsByClassName('task_answers')[0];
  domAnswerS.style.display=dom.selectedIndex===0?'block':'none';
};

function taskStepAnswerPut( dom ){
  var domStep = dom.parentNode.parentNode;
  var domAnswerS = domStep.getElementsByClassName('task_answers')[0];
  var domAnswerNew = document.createElement('div');
  domAnswerNew.innerHTML = '<input type="text" name="task_step[][answer][]" /><input type="button" onclick="taskStepAnswerCut(this)" value="Удалить данный вариант ответа" />';
  domAnswerS.insertBefore( domAnswerNew, dom );
};

function taskStepAnswerCut( dom ){
  var domAnswer = dom.parentNode; domAnswer.innerHTML='';
  domAnswer.remove?domAnswer.remove():(domAnswer.outerHTML='');
};

/// добавление очередной подзадачи(шага)
function taskStepPut(dom){
  var mold = '\
                <input class="task_step_cut" type="button" onclick="taskStepCut(this)" value="Удалить данную подзадачу" />\
                <div class="task_numer">Номер шага: 0</div>\
                <div>Тип подзадачи:\
                  <select required="required" name="task_step[][type]" onchange="taskTypeTurn(this)">\
                    <option value="0" selected="selected">Предопределенные ответы</option>\
                    <option value="1">Фотоответ(снимок с камеры)</option>\
                    <option value="2">Ответ в свободной форме</option>\
                  </select>\
                </div>\
                <div>Приложить иллюстрации или файлы к подзадаче: <input type="file" name="task_step[][file][]" multiple="true" min="1" max="12" /></div>\
                <div>Описание подзадачи/вопрос:\
                  <textarea name="task_step[][question]"></textarea>\
                </div>\
                <div class="task_answers">Предопределенные ответы:<br />\
                  <input type="button" onclick="taskStepAnswerPut(this)" value="Добавить вариант ответа" />\
                </div>\
  ';

  var domStep = document.createElement('div');
  domStep.className = 'task_step';
  domStep.innerHTML = mold;

  document.getElementById('task_steps').insertBefore( domStep, dom );
  taskStepNumerize()
};

/// удаление подзадачи(шага)
function taskStepCut( dom ){
  var domStep = dom.parentNode; domStep.innerHTML='';
  domStep.remove?domStep.remove():(domStep.outerHTML='');
  taskStepNumerize()
};

