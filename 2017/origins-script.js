'use strict';

const maxes = [2, 12, 100, 200, 400, 1000, 10000, 20000, 200000, 1e6];

maxes.forEach(showInfo);

function showInfo(max)
{
	const values = [];
	for (let i = 1; i <= max; i++)
	{
		values.push(1 / i);
	}
	const sum = values.reduce((a, b) => a + b);
	const probs = values.map(value => value / sum);

	const total = probs.reduce((a, b) => a + b);
	const info = probs.map(prob => getInfo(prob)).reduce((a, b) => a + b);

	console.log('Probs %s, info %s, log2(length) %s, total is %s', probs.length, info, getLog2(probs.length), total);
}

function getInfo(prob)
{
	return - prob * Math.log(prob) / Math.log(2);
}

function getLog2(value)
{
	return Math.log(value) / Math.log(2);
}

