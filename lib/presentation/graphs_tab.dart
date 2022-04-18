import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _ChartData {
  _ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

class GraphsTab extends StatelessWidget {
  const GraphsTab({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    const graphWidgets = [
      _BarChart(),
      _PieChart(),
    ];
    return SafeArea(
      top: false,
      bottom: false,
      child: CustomScrollView(
        key: PageStorageKey<String>(name),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => graphWidgets[index],
                childCount: graphWidgets.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BarChart extends StatefulWidget {
  const _BarChart({Key? key}) : super(key: key);

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<_BarChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('MON', 12),
      _ChartData('TUE', 15),
      _ChartData('WED', 30),
      _ChartData('THU', 6),
      _ChartData('FRI', 14),
      _ChartData('SAT', 14),
      _ChartData('SUN', 14),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
      tooltipBehavior: _tooltip,
      title: ChartTitle(text: 'Completed Tasks by day'),
      series: <ChartSeries<_ChartData, String>>[
        ColumnSeries<_ChartData, String>(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          name: 'Tasks',
          color: const Color.fromRGBO(8, 142, 255, 1),
        )
      ],
    );
  }
}

class _PieChart extends StatelessWidget {
  const _PieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_ChartData> chartData = [
      _ChartData('ACTIVE', 25, Colors.pink),
      _ChartData('COMPLETED', 38, Colors.purple),
      _ChartData('DELAYED', 34),
    ];
    return SfCircularChart(
      title: ChartTitle(text: 'Task Status'),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: [
        PieSeries<_ChartData, String>(
          dataSource: chartData,
          pointColorMapper: (_ChartData data, _) => data.color,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
        )
      ],
    );
  }
}
