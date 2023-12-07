export const onearg = function onearg(input) {
    onearg.count = (onearg.count || 0) + 1;
    console.log("#" + onearg.count + ": " + input);
    return input + "!!!";
};

export const noargs = function noargs() {
    noargs.count = (noargs.count || 0) + 1;
    console.log("#" + noargs.count + ": <noargs>");
    return "<noargs>";
}
