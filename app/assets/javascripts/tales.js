

function checkMaxlength(line)
{
      var max = parseInt(line.getAttribute('maxlength'));
      var current = line.value.length;

      if ( line.getAttribute && current > max )
      {
          line.value = line.value.substring(0, max);
      }
} //@ END OF DjCheckMaxlength()