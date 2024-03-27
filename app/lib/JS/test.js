function findAllPaths(start, end, connections, currentPath = [], visited = new Set()) {
    if (start === end) {
        return [currentPath.concat(start)];
    }

    visited.add(start);
    let paths = [];

    for (let connection of connections) {
        const [from, to] = connection.split('-');
        if (from === start && !visited.has(to)) {
            const newPaths = findAllPaths(to, end, connections, currentPath.concat(from), visited);
            paths = paths.concat(newPaths);
        }
    }

    visited.delete(start);
    return paths;
}

const arr = ['a-b', 'b-c', 'a-d', 'c-d', 'd-f'];
const paths = findAllPaths('a', 'f', arr);

console.log(paths);



// 方法1：使用 reduce() 函数
const array1 = [1, 2, 3, 5, 9];
const array2 = [1, 2, 3, 5, 6, 7];

const sum1 = array1.reduce((acc, currentValue) => acc + currentValue, 0);
const sum2 = array2.reduce((acc, currentValue) => acc + currentValue, 0);

console.log(sum1); // 输出 11
console.log(sum2); // 输出 24



// 扩展数组原型
Array.prototype.sum = function() {
    let total = 0;
    for (let i = 0; i < this.length; i++) {
        total += this[i];
    }
    return total;
};

// 测试
const array11 = [1, 2, 3, 5];
const array22 = [1, 2, 3, 5, 6, 7];

console.log(array11.sum()); // 输出 11
console.log(array22.sum()); // 输出 24


debugger;