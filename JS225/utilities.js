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

      findWhere(properties) {
        let match;

        element.some(obj => {
          let all_match = true;

          for (let prop in properties) {
            if (!(prop in obj) || obj[prop] !== properties[prop]) {
              all_match = false;
            }
          }
          if (all_match) {
            match = obj;
            return true;
          }
        });
        return match;
      },

      where(properties) {
        let arr = []

        element.some(obj => {
          for (let prop in properties) {
            if ((prop in obj) && obj[prop] === properties[prop]) {
              arr.push({
                properties
              });
            }
          }
        });
        return arr;
      },

      pluck(key) {
        let arr = [];
        // console.log(Object.keys(element));
        element.forEach(obj => {
          // if (Object.keys(obj)[0] === key) {
            if (obj[key]) {
            arr.push(obj[key]);
          }
        });
        return arr;
      },

      keys() {
        return Object.keys(element);
      },

      values() {
        return Object.values(element);
      },

      pick(...args) {
        let newObj = {};
        args.forEach(prop => {
          if (Object.hasOwn(element, prop)) {
            newObj[prop] = element[prop];
          }
        })

        return newObj;
      },

      omit(...args) {
        let newObj = {};

        for (let prop in element) {
          args.forEach(arg => {
            if (prop !== arg) {
              newObj[prop] = element[prop];
            }
          })
        }
        return newObj;
      },

      has(prop) {
        element.hasOwnProperty = {};
        return Object.hasOwn(element, prop);
      },

      isElement(obj) {
        return obj && obj.nodeType === 1;
      },

      // isArray() {

      // },

      // isObject() {

      // },
     }

  }


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

  _.extend = function(...args) {
    let oldObj = args.pop(),
        newObj = args[args.length - 1];

    for (let prop in oldObj) {
      newObj[prop] = oldObj[prop];
    }
    return args.length === 1 ? newObj : _.extend.apply(_, args);
  }

  _.isElement = function(obj) {
    return obj && obj.nodeType === 1;
  };

  _.isArray = Array.isArray || function(obj) {
    return toString.call(obj) === "[object Array]";
  }

  _.isObject = function(obj) {
    let type = typeof obj;

    return type === "function" || type === "object" && !!obj;
  }

  _.isFunction = function(obj) {
    let type = typeof obj;

    return type === "function";
  }

  _.isBoolean = function(obj) {
    return toString.call(obj) === "[object Boolean]";
  }

  _.isString = function(obj) {
    return toString.call(obj) === "[object String]";
  }

  _.isElement = function() {
    return toString.call(obj) === "[object Number]";
  }

  window._ = _;
})();
