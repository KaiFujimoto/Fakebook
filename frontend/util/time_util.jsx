import moment from "moment";

export function timeUtil(time) {
  if (moment(time).isAfter(moment().subtract(24,'hours'))) {
    return moment(time).startOf(time).fromNow();
  } else if (moment(time).isAfter(moment().subtract(24,'hours').startOf('day'))) {
    return moment(time).format('[Yesterday] [at] h:mma' );
  } else {
    return moment(time).format('MMMM D [at] h:mma');
  }
}
