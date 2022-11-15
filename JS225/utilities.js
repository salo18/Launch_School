(function() {
  var _ = function(element) {
    return {
      first() {
        return element[0];
      },

      last() {
        return element[element.length - 1];
      },

      without(...args) {
        if (args.length === 1) {
          let i = element.indexOf(args[0]);
          element.splice(i, 1);
          return element;
        } else if (args.length > 1) {
          args.forEach(num => {
            let i = element.indexOf(num);
            element.splice(i, 1);
          });
          return element;
        }
      },

      lastIndexOf(num) {
        return element.findLastIndex(x => x === num);
      },

      sample(num) {
        if (num === undefined) {
          return element[0];
        }

        let counter = 0;
        let newArr = [];
        for (let i = 0; i <= num; i += 1) {
          if (!newArr.includes(element[i])) {
            newArr.push(element[i]);
            counter += 1;
          }
          if (counter === num) {
            break;
          }
        }

        return newArr;
      },

      findWhere() {
        
      }

    }
  }

  // _.range = function() {}

  _.range = function(...args) {
    let newArr = [];
    if (args.length === 1) {
      for (let i = 0; i < args[0]; i += 1) {
        newArr.push(i);
      }
    } else {
      for (let i = args[0]; i < args[1]; i += 1) {
        newArr.push(i);
      }
    }
    return newArr;
  }

  window._ = _;
})();
