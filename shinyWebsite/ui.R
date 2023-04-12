
#更多小图标同学们可以登录网站是浏览，记录有用的id，用于项目
# icon list
# https://fontawesome.com/icons?d=gallery&m=free
# 对应 icon("table")


dashboardPage(

  #dashboardHeader(title = "新冠疫情"),
  dashboardHeader(title = img(src = "logo_small.png", height= 40)),
  
  # 侧栏导航
  dashboardSidebar(
    sidebarMenu(
      menuItem("主页", tabName = "主页", icon = icon("home")),
      menuItem("新闻", tabName = "新闻", icon = icon("seedling")),
      menuItem("Statistics", tabName = "statistics", icon = icon('line-chart'),
               menuItem('Bar Charts',
                        tabName = 'barcharts_statistics',  # 要与后边的tabItem ID对应
                        icon = icon('angle-right')),
                menuItem('Scatterplot',
                        tabName = 'wordcloud_statistics',
                        icon = icon('angle-right'))
               ),
      menuItem("数据一览", tabName = "数据一览", icon = icon("table")),
      menuItem("Networks", tabName = "network",icon = icon("code-branch")),
      menuItem("Tutorials", tabName = "tutorial",icon = icon("list-alt")),
      menuItem("Downloads", tabName = "download", icon = icon('download'))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem("主页",
              fluidRow(
                valueBoxOutput("tools_count"),
                valueBoxOutput("circrna_publication_count"),
                valueBoxOutput("download")
              ),
              fluidRow(
                # color success is green
                box(
                  width = 8, status = "success", solidHeader = TRUE, 
                  title = "2019冠状病毒病疫情",
                  p("2019冠状病毒病疫情是由严重急性呼吸系统综合征冠状病毒2（SARS-CoV-2）导致的2019冠状病毒病（COVID-19）所引发的全球大流行疫情。"),
                  p("疾病在2019年末于中华人民共和国湖北省武汉市首次被发现，随后在2020年初迅速扩散至全球多国，逐渐变成一场全球性大瘟疫。"),
                  p("截至2022年5月25日，全球已累计报告逾5.26亿例确诊病例，其中逾628万人死亡，病死率约为1.19%，是人类历史上大规模流行病之一。世界各国对该病病死率的估计值差异甚大，多数国家该病的观测病死率在0.5%-5.0%之间。"),
                  p("目前研究表明，SARS-CoV-2最早可能于2019年10月至11月进入人类社会生活并开始传播，而目前明确已知的首宗感染个案于2019年12月1日在武汉市发病。
                  首位前往医院就诊的患者可能出现于12月12日2月中旬，中国大陆的疫情达到发展高峰，
                    "),
                  p("12月26日，武汉市呼吸与重症医学科医生张继先最早发现和上报此不明原因肺炎，并怀疑该病属传染病。
                  2020年1月13日起，疫情陆续蔓延到泰国、日本及韩国等相邻国家，至1月21日则波及到亚洲以外的美国西雅图。"),
                  p("。1月23日，武汉市新冠肺炎疫情防控指挥部宣布采取疫区封锁隔离措施，这是近代公共卫生史上第一次对千万人口规模的大城市采取封锁措施。
                  在1月30日，中国境外有3个国家证实出现社区传播，而世界卫生组织亦于当日宣布疫情为“国际公共卫生紧急事件”。"),
                  p("而2月底义大利、韩国与伊朗三国的确诊人数急速增加。2月29日，世卫组织将疫情的全球风险级别提升为“非常高”。
                  3月11日，欧洲与中东各国都出现了大量病例，世卫组织宣布此次疫情已构成“全球大流行”。此后欧洲、南美洲先后被宣布为本次大流行的中心。10月5日，世卫组织表示，根据“最确切推算”，全球约10%的人口可能已感染病毒。
                  截至2021年5月21日，根据世界卫生组织的估计，真正的死亡人数可能高达官方报告的2-3倍，约至少600万-800万人 。"),
                  p("这次疫情导致严重的全球性的社会和经济混乱，并使全球经济陷入自从1930年代的大萧条以来最大的衰退。危机爆发的初期，亦遇上全球医疗与民生用品因为恐慌性消费导致供应不足、传布假新闻与针对不同族裔产生种族或地域等歧视的问题。许多教育机构和公共区域被部分或完全关闭，很多活动被取消或推迟。
                  而疫情扩散对全球航空、旅游、娱乐、体育、石油市场、金融市场等方面造成巨大影响。"),
                  p("导致本次疫情的疾病2019冠状病毒病，由感染病原体至症状浮现之间的潜伏期平均为5至6天，一般情况下由1至14天不等，有个别病例可达24天；即使没有发烧，没有感染迹象或仅有轻微感染迹象的感染者也可以将病毒传染给他人，症状筛查无法有效检测；且轻症患者症状类似于同期流行的流行性感冒，因而易导致患者、家属及政府误判。
                    同时，虽然2019冠状病毒病主要通过人近距离接触传播，但该病亦已经被发现可以通过被污染的物品表面等环境因素传播。"),
                  p("这意味着它比中东呼吸综症（MERS）或严重急性呼吸系统综合症（SARS）的疫情更难控制。实际上，这次疫情仅花四分之一的时间就造成沙士事件十倍的确诊数字。2019冠状病毒病的病原体亦已经出现至少2次变异，传染性亦急剧增强。
                    目前对病毒的研究仍存在知识差距，包括病毒来源、病毒发源地等关键因素仍不能确定。")
                  ),
                
                box(
                  width = 4, status = "info", solidHeader = TRUE,
                  title = "中印日美英五国自2020年到2022年新冠疫情感染走势",
                  plotOutput('pl', width='100%', height='400px')
                ),
                
                box(
                  width = 8, status = "success", solidHeader = TRUE, 
                  title = "全球新冠疫情感染区域总数可视化图片",
                  p("圆圈越大证明越多，图片来与Google"),
                  img(src = "a.png", width='100%')
                ),
               
              )
      ),
      
      tabItem("新闻",
              fluidRow(
                valueBoxOutput("rice_areas"),
                valueBoxOutput("rice_pulation"),
                valueBoxOutput("rice")
              ),
              fluidRow(
                # color primary is blue
                box(
                  width = 8, status = "primary", solidHeader = TRUE, 
                  title = " ",
                  p("全休疫苗接种请况的可视化图片"),
                  img(src="b.png", width = 700),
                  p("可以看到我们国家的接种率更高。"),
                  p("新冠疫情的接种率对于经济复苏起到了决定性的作用。"),
                  p("格奥尔基耶娃表示，如果疫苗无法如预期的那样顺利研发生产，全球复苏将会更加缓慢和艰难，不平等加剧的风险也将上升。

格奥尔基耶娃：“基金组织希望每一个人都明白以下两点。首先，在二三月间的经济冲击发生后，各国调动了前所未有的财政资源和货币政策，通俗地说，就是投入了大量的金钱来应对这一问题，正是如此大规模的资金注入，才托住了全球经济的‘底盘’，让企业在防疫封锁期间不倒闭，让工人还能领到工资，因此我要说的第一点是，不要过早撤回这些支持，在为疫情危机找到可持续的出路之前，我们需要继续支持全球的经济和生计。

第二，全球在这段时期内也学会了如何与疫情共处，通过戴口罩、保持社交距离和勤洗手等公共卫生措施，我们能够在没有疫苗的情况下重启部分经济活动，尤其是在制造业部门，但服务业和旅游业等依赖人际接触的行业仍在不断萎缩，因此，我们需要疫苗让这些行业也能重启，实现更加均衡的全球增长，如果没有疫苗，这些行业将会变得十分困难。”")

                  ),
                box(
                  width = 4, status = "info", solidHeader = TRUE,
                  title = "新增疫情和新增疫苗接种的走势",
                  #这里可以添加函数，从后台接收绘图
                  img(src="c.png", width = 700),
                )
                  )
              ),
      tabItem("数据一览",
             
              fluidRow(
                box(
                  width = 12, status = "success", solidHeader = TRUE, 
                  title = "Filtered Tools",
                  # DT::dataTableOutput("toolstable"),
                  mainPanel(
                    tabsetPanel(
                      id = 'show.tools.list',
                      tabPanel("Show data as Table", DT::dataTableOutput("showtable")),
                      tabPanel("Show data as Chart", DT::dataTableOutput("toolstable2"))
                    )
                  )
                )
              )
              ),
      tabItem("barcharts_statistics",
              fluidRow(
                box(
                  title = "Controls",
                  sliderInput("year.range", "Year Range:",
                              min = 2002, max = 2019,
                              value = c(2006,2019))
                )
              ),
              fluidRow(
                # 来自ggplot2的图
                box(plotOutput("plot.tools.count", height = 400))
              ),
              fluidRow(
                #来自echart的图
                box(echarts4rOutput("plot.publications.count", height = 250))
              )
      ),
      tabItem("Scatterplot",
              fluidRow(
                
              ),
              fluidRow(

              )
      ),
      tabItem("network",
              fluidRow(
                box(
                  title = "Controls",
                  sliderInput("network.range", "Year Range:",
                              min = 2011, max = 2019,
                              value = c(2011,2019))
                )
              ),
              fluidRow(
                box(
                  echarts4rOutput("plot.network")
                  )
              )
      )
    )
  )
)