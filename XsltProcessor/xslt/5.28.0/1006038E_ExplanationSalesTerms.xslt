<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:est="urn:customs.ru:Information:CustomsDocuments:ExplanationSalesTerms:5.24.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="//*[local-name()='ExplanationSalesTerms']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date2">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date2">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="has_node">
		<xsl:param name="node"/>
		<xsl:variable name="xpath_bool">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$node"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_bool}">
			<xsl:choose>
				<xsl:when test="$node">
					<xsl:choose>
						<xsl:when test="string-length($node) &gt; 0">
							<span align="right" class="normal2" style="width:5mm"> X</span>
						</xsl:when>
						<xsl:otherwise>
							<span class="normal2" style="width:5mm">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</span>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<span class="normal2" style="width:5mm">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</span>
				</xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	<xsl:template name="bool_with_td">
		<xsl:param name="node"/>
		<xsl:param name="td2" select="''"/>
		<xsl:param name="inv" select="'0'"/>
		<xsl:variable name="xpath_bool">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$node"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$inv='0'">
				<xsl:choose>
					<xsl:when test="$node = 'true' or $node = 't' or $node = '1' or $node = 'TRUE' or $node = 'True'">
						<td class="normal2" style="width:5mm">
							<element xml_node="{$xpath_bool}"> X</element>
						</td>
						<xsl:if test="string-length($td2) &gt; 0">
							<td class="normalMain" style="width:50mm">
								<xsl:value-of select="$td2"/>
							</td>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<td class="normal2" style="width:5mm">
							<element xml_node="{$xpath_bool}">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</element>
						</td>
						<xsl:if test="string-length($td2) &gt; 0">
							<td class="normalMain" style="width:50mm">
								<xsl:value-of select="$td2"/>
							</td>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$node = 'false' or $node = 'f' or $node = '0' or $node = 'FALSE' or $node = 'False'">
						<td class="normal2" style="width:5mm">
							<element xml_node="{$xpath_bool}"> X</element>
						</td>
						<xsl:if test="string-length($td2) &gt; 0">
							<td class="normalMain" style="width:50mm">
								<xsl:value-of select="$td2"/>
							</td>
						</xsl:if>
					</xsl:when>
					<xsl:otherwise>
						<td class="normal2" style="width:5mm">
							<element xml_node="{$xpath_bool}">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</element>
						</td>
						<xsl:if test="string-length($td2) &gt; 0">
							<td class="normalMain" style="width:50mm">
								<xsl:value-of select="$td2"/>
							</td>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="bool_with_tbl">
		<xsl:param name="node"/>
		<xsl:variable name="xpath_bool">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$node"/>
			</xsl:call-template>
		</xsl:variable>
		<table border="0" cellspacing="0" style="width:47mm">
			<tbody>
				<td align="center" class="normalMain" style="width:10mm">Да</td>
				<xsl:choose>
					<xsl:when test="$node = 'true' or $node = 't' or $node = '1' or $node = 'TRUE' or $node = 'True'">
						<td align="right" class="normal2" style="width:2mm">
							<element xml_node="{$xpath_bool}"> X</element>
						</td>
					</xsl:when>
					<xsl:otherwise>
						<td class="normal2" style="width:2mm">
							<element xml_node="{$xpath_bool}">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</element>
						</td>
					</xsl:otherwise>
				</xsl:choose>
				<td align="center" class="normalMain" style="width:10mm">Нет</td>
				<xsl:choose>
					<xsl:when test="$node = 'false' or $node = 'f' or $node = '0' or $node = 'FALSE' or $node = 'False'">
						<td align="right" class="normal2" style="width:2mm">
							<element xml_node="{$xpath_bool}"> X</element>
						</td>
					</xsl:when>
					<xsl:otherwise>
						<td class="normal2" style="width:2mm">
							<element xml_node="{$xpath_bool}">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</element>
						</td>
					</xsl:otherwise>
				</xsl:choose>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="PeriodOfTime">
		<xsl:param name="b_node"/>
		<xsl:param name="t_node"/>
		<xsl:variable name="xpath_b_node">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$b_node"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="xpath_t_node">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$t_node"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$b_node= 'true' or $b_node= 't' or $b_node= '1' or $b_node= 'TRUE' or $b_node= 'True'">
				<td align="left" class="normal2" style="width:5mm">
					<element xml_node="{$xpath_b_node}"> X</element>
				</td>
				<td align="center" class="graphMain" style="width:28mm">период времени</td>
				<td align="center" class="graphMain" style="width:18mm">
					<element xml_node="{$xpath_t_node}">
						<xsl:value-of select="est:HistoryCooperation/est:KindCooperation/est:IdemSort/est:PeriodTime"/>
					</element>
				</td>
			</xsl:when>
			<xsl:otherwise>
				<td class="normal2" style="width:5mm">
					<element xml_node="{$xpath_b_node}">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</element>
				</td>
				<td align="center" class="graphMain" style="width:28mm">период времени</td>
				<td align="center" class="graphMain" style="width:18mm">
					<element xml_node="{$xpath_t_node}">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</element>
				</td>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date2">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="est:ExplanationSalesTerms">
		<html>
			<head>
				<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
				<title>Пояснения по условиям продажи, которые могли повлиять на цену сделки.</title>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
							.normal2{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: 1pt solid windowtext; border-right: 1pt solid windowtext; border-top: 1pt solid windowtext; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;border-left:  medium none; border-right:  medium none; border-top:  medium none; border-bottom: 1pt solid windowtext; 
						font-weight: normal;
						}
						.normalMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph10Bold {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}			
					</style>
			</head>
			<body>
				<div class="page">
					<table border="0" cellpadding="0" cellspacing="0" style="width:190mm">
						<tbody>
							<tr>
								<td align="center" class="bold" colspan="2" style="width:190mm">
								ПОЯСНЕНИЯ<br/> по условиям продажи, которые могли повлиять на цену сделки
								</td>
							</tr>
						</tbody>
					</table>
					<table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
						<tbody>
							<tr>
								<td class="graphMain" style="width:20mm">История сотрудни- <br/> чества Продавца и Покупателя</td>
								<td>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:136mm">1. Имеются ли у Покупателя (см. графу 1 ДТС-1) перед Продавцом (см. графу 2 ДТС-1) дополнительные (отличные от получения товара и уплаты установленной цены сделки) обязательства</td>
												<td align="center" class="graphMain" colspan="2">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:HistoryCooperation/est:AdditionalContract"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:136mm">2. Осуществлялось ли ранее сотрудничество между продавцом и покупателем? В случае ответа НЕТ далее к графе 5</td>
												<td align="center" class="graphMain" colspan="2">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:HistoryCooperation/est:CooperationEarly"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" colspan="4" style="width:170mm">3. Вид сотрудничества</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:125mm">(а) поставки от Продавца Покупателю идентичных товаров</td>
												<xsl:call-template name="PeriodOfTime">
													<xsl:with-param name="b_node" select="est:HistoryCooperation/est:KindCooperation/est:IdenticalGoods/est:Value"/>
													<xsl:with-param name="t_node" select="est:HistoryCooperation/est:KindCooperation/est:IdenticalGoods/est:PeriodTime"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:125mm">(б) товаров того же класса или вида </td>
												<xsl:call-template name="PeriodOfTime">
													<xsl:with-param name="b_node" select="est:HistoryCooperation/est:KindCooperation/est:IdemSort/est:Value"/>
													<xsl:with-param name="t_node" select="est:HistoryCooperation/est:KindCooperation/est:IdemSort/est:PeriodTime"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:125mm">(в) товаров другого класса или вида </td>
												<xsl:call-template name="PeriodOfTime">
													<xsl:with-param name="b_node" select="est:HistoryCooperation/est:KindCooperation/est:OtherSort/est:Value"/>
													<xsl:with-param name="t_node" select="est:HistoryCooperation/est:KindCooperation/est:OtherSort/est:PeriodTime"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:125mm">(г) оказание услуг </td>
												<xsl:call-template name="PeriodOfTime">
													<xsl:with-param name="b_node" select="est:HistoryCooperation/est:KindCooperation/est:RenderingService/est:Value"/>
													<xsl:with-param name="t_node" select="est:HistoryCooperation/est:KindCooperation/est:RenderingService/est:PeriodTime"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:125mm">(д) поставки товаров от Покупателя Продавцу </td>
												<xsl:call-template name="PeriodOfTime">
													<xsl:with-param name="b_node" select="est:HistoryCooperation/est:KindCooperation/est:DeliveryGoodsBuyerSeller/est:Value"/>
													<xsl:with-param name="t_node" select="est:HistoryCooperation/est:KindCooperation/est:DeliveryGoodsBuyerSeller/est:PeriodTime"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:125mm">(е) иное сотрудничество (ниже указать вид) </td>
												<xsl:call-template name="PeriodOfTime">
													<xsl:with-param name="b_node" select="est:HistoryCooperation/est:KindCooperation/est:DifferentCooperation/est:Value"/>
													<xsl:with-param name="t_node" select="est:HistoryCooperation/est:KindCooperation/est:DifferentCooperation/est:PeriodTime"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:136mm">4. Покупатель и продавец являются постоянными партнерами?</td>
												<td align="center" class="graphMain" colspan="2">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:HistoryCooperation/est:ConstantPartner"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:136mm">5. Согласен ли продавец предоставить данные о затратах на производство (приобретение) товаров и (или) затратах на их продажу на экспорт в Российскую Федерацию <br/> Если ДА, укажите какие именно<br/>
													<xsl:if test="est:HistoryCooperation/est:PutInformationCost= 'true' or est:HistoryCooperation/est:PutInformationCost= 't' or est:HistoryCooperation/est:PutInformationCost= '1'">
														<xsl:apply-templates select="est:HistoryCooperation/est:CommentsPutInformationCos"/>
													</xsl:if>
												</td>
												<td align="center" class="graphMain" colspan="2">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:HistoryCooperation/est:PutInformationCost"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">6. Поиск продавца для покупки данного товара или ранее до начала сотрудничества осуществлялся:</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm"> при участии посредника </td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:HistoryCooperation/est:SearchSeller/est:Middleman"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm"> по рекламным объявлениям </td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:HistoryCooperation/est:SearchSeller/est:Commercial"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm"> на бирже</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:HistoryCooperation/est:SearchSeller/est:Exchange"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm"> иным образом (указать способ)<xsl:text> </xsl:text>
													<xsl:if test="est:HistoryCooperation/est:SearchSeller/est:Otherwise = 'true' or est:HistoryCooperation/est:SearchSeller/est:Otherwise = 't' or est:HistoryCooperation/est:SearchSeller/est:Otherwise = '1'">
														<xsl:apply-templates select="est:HistoryCooperation/est:SearchSeller/est:CommentsOtherwise"/>
													</xsl:if>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:HistoryCooperation/est:SearchSeller/est:Otherwise"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">7. Был выбран именно этот продавец, поскольку:</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(а) Продавец является производителем товаров</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:HistoryCooperation/est:ChoiceSeller/est:Producer"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(б) Продавец является официальным представителем производителя</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:HistoryCooperation/est:ChoiceSeller/est:OfficialRepresentativeProducer"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(в) Продавец предоставляет гарантийное обслуживание товаров</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:HistoryCooperation/est:ChoiceSeller/est:Guarantee"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(г) были предложены более выгодные условия покупки товаров, сравнительно с другими участниками рынка (указать подробности)
													<xsl:if test="est:HistoryCooperation/est:ChoiceSeller/est:ProfitableTerm = 'true' or est:HistoryCooperation/est:ChoiceSeller/est:ProfitableTerm = 't' or est:HistoryCooperation/est:ChoiceSeller/est:ProfitableTerm = '1'">
														<xsl:apply-templates select="est:HistoryCooperation/est:ChoiceSeller/est:CommentsProfitableTerm"/>
													</xsl:if>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:HistoryCooperation/est:ChoiceSeller/est:ProfitableTerm"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">Иные причины (указать)
													<xsl:if test="est:HistoryCooperation/est:ChoiceSeller/est:Otherwise='true' or est:HistoryCooperation/est:ChoiceSeller/est:Otherwise='t' or est:HistoryCooperation/est:ChoiceSeller/est:Otherwise='1'">
														<xsl:apply-templates select="est:HistoryCooperation/est:ChoiceSeller/est:OtherwiseComments"/>
													</xsl:if>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:HistoryCooperation/est:ChoiceSeller/est:Otherwise"/>
												</xsl:call-template>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain" style="width:30mm"> Выбор и заказ товара</td>
								<td>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" style="width:136mm">8. Имеется ли у Покупателя подразделение, занимающееся изучением<br/> 
								конъюнктуры рынка и(или) оценкой эффективности сделок?</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:DepartmentAnalysis"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">9. Анализировало ли это подразделение предложения других Продавцов,<br/> 
								занимающихся поставками товара того же класса или вида</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:Analysis"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">Если ДА, то можете ли Вы предоставить материалы их исследований</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:Study"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="1" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">10. Выбор товара осуществлялся</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">по образцам
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:ChoiceGood/est:Sample"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">по описанию
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:ChoiceGood/est:Description"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">в соответствии с действующими стандартами (указать стандарт, кем принят, регламентирующие его соблюдение документы)
													<xsl:if test="est:ChoiceOrderGoods/est:ChoiceGood/est:Standard='true' or est:ChoiceOrderGoods/est:ChoiceGood/est:Standard='t' or est:ChoiceOrderGoods/est:ChoiceGood/est:Standard='1'">
														<xsl:apply-templates select="est:ChoiceOrderGoods/est:ChoiceGood/est:CommentsStandard"/>
													</xsl:if>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:ChoiceGood/est:Standard"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">иным образом (указать способ)
													<xsl:if test="est:ChoiceOrderGoods/est:ChoiceGood/est:Otherwise='true' or est:ChoiceOrderGoods/est:ChoiceGood/est:Otherwise='t' or est:ChoiceOrderGoods/est:ChoiceGood/est:Otherwise='1'">
														<xsl:apply-templates select="est:ChoiceOrderGoods/est:ChoiceGood/est:OtherwiseComments"/>
													</xsl:if>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:ChoiceGood/est:Otherwise"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">11. Как осуществлялся заказ товара</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">товар произведен специально для Покупателя и не является серийным
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:OrderGoods/est:Specially"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">товар серийного производства произведен по предварительному заказу Покупателя
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:OrderGoods/est:Serially"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">товар поставляется по отдельным заказам со склада
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:OrderGoods/est:SupplyStore"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">Если ДА, указать собственника склада либо, соответственно, лицо, заключавшее договор на хранение на складе (например, производитель, продавец, отправитель) <span class="normal">
														<xsl:apply-templates select="est:ChoiceOrderGoods/est:OrderGoods/est:SupplyStoreComments "/>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" style="width:170mm">товар поставляется по предварительно согласованному графику</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:OrderGoods/est:Time-table"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:170mm">товар поставляется с выставки, витрины, после испытаний</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:OrderGoods/est:Exhibition"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:170mm">товар, бывший в употреблении, поставляется от бывшего владельца</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:OrderGoods/est:Second-hand"/>
												</xsl:call-template>
											</tr>
										</tbody>
									</table>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="normalMain" style="width:75mm">12. В рамках контракта поставляются товары:</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:DeliveryGoodsUnderContract"/>
													<xsl:with-param name="td2" select="'одного класса или вида '"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:75mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:DeliveryGoodsUnderContract"/>
													<xsl:with-param name="td2" select="'различного класса или вида '"/>
													<xsl:with-param name="inv" select="'1'"/>
												</xsl:call-template>
											</tr>
										</tbody>
									</table>
									<table border="1" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm;border: 1pt solid windowtext;">13. Поставляемый товар:</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(а) подготовлен для розничной продажи
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:DeliveryGoods/est:Retail"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(б) требует упаковки, сортировки перед розничной продажей
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:DeliveryGoods/est:PackingSorting"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(в) предназначен для использования в производстве в качестве сырья или сопутствующих товаров
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:DeliveryGoods/est:ProductionRawMaterial"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(г) будет использован в качестве средства производства
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:DeliveryGoods/est:MeansProduction"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(д) предназначен для собственного потребления
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:ChoiceOrderGoods/est:DeliveryGoods/est:OwnConsumption"/>
												</xsl:call-template>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain" style="width:30mm"> Форми- <br/>рование цены сделки </td>
								<td>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" style="width:136mm">14. Имеется ли у Покупателя информация об уровне рыночных цен на такого вида товары</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:PriceLeve"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">15. Корреспондирует ли первоначальная цена предложения такому уровню цен</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:InitialOfferPriceAppropriateLevel"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">Укажите процент отклонения 
												<span class="normal">
														<xsl:apply-templates select="est:PricingTransactions/est:PercentageDeviation"/>
													</span>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">16. Совпадает ли цена сделки с первоначальной ценой предложения?<br/>
												Если НЕТ, заполнить графы 17-25</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:SalePriceInitialOfferPrice"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">17. Какой процент отличия от первоначальной цены?
												<span class="normal">
														<xsl:apply-templates select="est:PricingTransactions/est:PercentageDifferences"/>
													</span>
												</td>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">18. Отличие вызвано скидкой
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">на количество товаров</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:Discount/est:QuantityGoods"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">на условия оплаты</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:Discount/est:RepaymentTerms"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">сезонные</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:Discount/est:Seasonal"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">иные (указать)
												<xsl:if test="est:PricingTransactions/est:Discount/est:Other= 'true' or est:PricingTransactions/est:Discount/est:Other= 't' or est:PricingTransactions/est:Discount/est:Other= '1'">
														<xsl:apply-templates select="est:PricingTransactions/est:Discount/est:Comments"/>
													</xsl:if>
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:Discount/est:Other"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:90mm">19. Отличие вызвано нестандартной ситуацией </td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">резкое падение курса национальной валюты
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:NonStandardSituationMarket/est:DopRate"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">резкое повышение курса национальной валюты
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:NonStandardSituationMarket/est:IncreaseRate"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">затоваривание рынка
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:NonStandardSituationMarket/est:GlutMarket"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">дефицит на рынке
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:NonStandardSituationMarket/est:DeficitMarket"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">иное (указать подробности)
												<xsl:if test="est:PricingTransactions/est:NonStandardSituationMarket/est:Other = 'true' or est:PricingTransactions/est:NonStandardSituationMarket/est:Other = 't' or est:PricingTransactions/est:NonStandardSituationMarket/est:Other = '1'">
														<xsl:apply-templates select="est:PricingTransactions/est:NonStandardSituationMarket/est:Comments"/>
													</xsl:if>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:NonStandardSituationMarket/est:Other"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:90mm">20. Отличие вызвано положением Продавца </td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">необходимы наличные средств
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:PositionSeller/est:FundsAvailable"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">затоваривание склада
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:PositionSeller/est:GlutWarehouse"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">банкроство
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:PositionSeller/est:Bankruptcy"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">иное (указать подробности)
												<xsl:if test="est:PricingTransactions/est:PositionSeller/est:Other = 'true' or est:PricingTransactions/est:PositionSeller/est:Other = '1' or est:PricingTransactions/est:PositionSeller/est:Other = 't' or est:PricingTransactions/est:PositionSeller/est:Other = 'True' or est:PricingTransactions/est:PositionSeller/est:Other = 'TRUE'">
														<xsl:apply-templates select="est:PricingTransactions/est:PositionSeller/est:Comments"/>
													</xsl:if>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:PositionSeller/est:Other"/>
												</xsl:call-template>
											</tr>
										</tbody>
									</table>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">21. Отличие вызвано особыми отношениями Продавца и Покупателя: </td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">длительная история сотрудничества</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:SpecialRelationship/est:Cooperation"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">Покупатель предоставляет продавцу предоплату</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:SpecialRelationship/est:Prepayment"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">Покупатель принимает дополнительные обязательства по объему продажи товара</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:SpecialRelationship/est:ExtraDuty"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">иное (указать подробности)
												<xsl:if test="est:PricingTransactions/est:SpecialRelationship/est:Other = 'true' or est:PricingTransactions/est:SpecialRelationship/est:Other = 't' or est:PricingTransactions/est:SpecialRelationship/est:Other = '1'">
														<xsl:apply-templates select="est:PricingTransactions/est:SpecialRelationship/est:Comments"/>
													</xsl:if>
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:SpecialRelationship/est:Other"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">22. Другие причины отличия (указать подробности)
												<xsl:if test="est:PricingTransactions/est:OtherReasonsDifferences = 'true' or est:PricingTransactions/est:OtherReasonsDifferences = 't' or est:PricingTransactions/est:OtherReasonsDifferences = '1'">
														<xsl:apply-templates select="est:PricingTransactions/est:CommentsOtherReasonsDifferences"/>
													</xsl:if>
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:OtherReasonsDifferences"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">23. Согласование цены сделки проходило</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">путем личных переговоров представителей продавца и покупателя (укажите где и кто участвовал)
												<xsl:if test="est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence = 'true' or est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence = 't' or est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence = '1'">
														<xsl:apply-templates select="est:PricingTransactions/est:AlignmentPrices/est:NegotiationsComments"/>
													</xsl:if>
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:AlignmentPrices/est:NegotiationsCorrespondence"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">по переписке
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:AlignmentPrices/est:Correspondence"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">путем личных переговоров представителей продавца и покупателя и по переписке
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:AlignmentPrices/est:Negotiations"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">24. Сохранилась ли у Покупателя переписка?
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:KeepCorrespondence"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">25. Может ли она быть представлена таможенным органам?<br/>Если НЕТ, обьясните причины
												<xsl:if test="est:PricingTransactions/est:GrantCorrespondence = 'false' or est:PricingTransactions/est:GrantCorrespondence = 'f' or est:PricingTransactions/est:GrantCorrespondence = '0'">
														<xsl:apply-templates select="est:PricingTransactions/est:ReasonGrantCorrespondence"/>
													</xsl:if>
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:GrantCorrespondence"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">26. Являлась ли первоначальная цена предложения публичной офертой (в терминах ст. 494 Гражданского кодекса Российской Федерации)?<br/>Если ДА, заполнить графу 25
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:PubliclyOffer"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">27. Каким образом была выражена публичная оферта Продавца?</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">в прайс-листе в офисе продавца (указать фактический адрес<br/>
													<xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList = 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList = '1'">
														<span class="normal">
															<xsl:apply-templates select="est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceListAddressOffice "/>
														</span>
													</xsl:if>
													<xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList = 'false' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList = 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList = '0'">
														<span class="normal">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
														</span>
													</xsl:if> )											
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:ExpressPubliclyOffer/est:PriceList"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">в открытом источнике печати (указать каком, где и когда издан<br/>
													<xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = '1'">
														<span class="normal">
															<xsl:apply-templates select="est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrintingComments "/>
														</span>
													</xsl:if>
													<xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = 'false'  or est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting = '0'">
														<span class="normal">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
														</span>
													</xsl:if> )											
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:ExpressPubliclyOffer/est:PublicSourcePrinting"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">в других средствах массовой информации (указать, в каких и когда) <br/>
													<xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = '1'">
														<span class="normal">
															<xsl:apply-templates select="est:PricingTransactions/est:ExpressPubliclyOffer/est:MediaComments "/>
														</span>
													</xsl:if>
													<xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = 'false' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Media = '0'">
														<span class="normal">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
														</span>
													</xsl:if>
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:ExpressPubliclyOffer/est:Media"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm"> на открытом сайте Продавца в Интернете (указать адрес <br/>
													<xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = '1'">
														<span class="normal">
															<xsl:apply-templates select="est:PricingTransactions/est:ExpressPubliclyOffer/est:SiteAddress "/>
														</span>
													</xsl:if>
													<xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = 'false'  or est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = 'f' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Site = '0'">
														<span class="normal">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
														</span>
													</xsl:if> ) 											
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:ExpressPubliclyOffer/est:Site"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm"> иным образом (указать подробности) <br/>
													<xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise = 'true' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise = 't' or est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise = '1'">
														<span class="normal">
															<xsl:apply-templates select="est:PricingTransactions/est:ExpressPubliclyOffer/est:OtherwiseComments "/>
														</span>
													</xsl:if>
													<xsl:if test="est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise = 'false'">
														<span class="normal">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
														</span>
													</xsl:if>
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:PricingTransactions/est:ExpressPubliclyOffer/est:Otherwise"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="1" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">28. Известно ли покупателю, исходя из какой величины формировалась цена перноначального предложения</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">биржевая цена
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:ValueFormingPrice/est:ExchangePrice"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">цена на товары того же класса или вида других предложений при продаже товаров на экспорт из страны производства
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:ValueFormingPrice/est:PriceOtherProposals"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">исходя из цен на товары того же класса или вида у других Продавцов при продаже товаров на экспорт из страны отправления
													</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:ValueFormingPrice/est:PriceOtherVendors"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">исходя из себестоимости производства
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:ValueFormingPrice/est:CostPrice"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">исходя из цены возможной реализации на внутреннем рынке Российской Федерации
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:ValueFormingPrice/est:SalesDomesticMarket"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">не известно
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:PricingTransactions/est:ValueFormingPrice/est:NotKnown"/>
												</xsl:call-template>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain" style="width:30mm">Сведения о договоре и условиях поставки </td>
								<td>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" style="width:50mm"> 29. Вид договора</td>
												<td align="center" class="graphMain" style="width:35mm">купля-продажа
										<xsl:call-template name="has_node">
														<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale"/>
													</xsl:call-template>
												</td>
												<td align="center" class="graphMain" style="width:20mm">бартер
										<xsl:call-template name="has_node">
														<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange"/>
													</xsl:call-template>
												</td>
												<td class="graphMain" style="width:30mm">лизинговое соглашение
										<xsl:call-template name="has_node">
														<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement"/>
													</xsl:call-template>
												</td>
												<td align="center" class="graphMain" style="width:35mm">иной (указать вид) 
												<xsl:choose>
												  <xsl:when test="est:InfoContractDeliveryTerms/est:KindContract/est:Other!=''">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:KindContract/est:Other/est:OtherComments"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:50mm"> день заключения</td>
												<td class="graphMain" colspan="2" style="width:55mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale/est:DateSettlement"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange/est:DateSettlement"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="graphMain" colspan="2">
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement/est:DateSettlement"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Other">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:Other/est:DateSettlement"/>
														</xsl:call-template>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:50mm">день окончания действия (если определено договором) </td>
												<td class="graphMain" colspan="2" style="width:55mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale/est:ExpiryDate"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange/est:ExpiryDate"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
												</td>
												<td class="graphMain" colspan="2">
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement/est:DateSettlement"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Other">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="est:InfoContractDeliveryTerms/est:KindContract/est:Other/est:ExpiryDate"/>
														</xsl:call-template>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:50mm">применяемое право (если определено договором)  </td>
												<td class="graphMain" colspan="2" style="width:55mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale/est:ApplicableLaw"/>
													</xsl:if>
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange/est:ApplicableLaw"/>
													</xsl:if>
													<br/>
												</td>
												<td class="graphMain" colspan="2">
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement/est:ApplicableLaw"/>
													</xsl:if>
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Other">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:KindContract/est:Other/est:ApplicableLaw"/>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:50mm">место заключения </td>
												<td class="graphMain" colspan="2" style="width:55mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:KindContract/est:PurchaseSale/est:PlaceDetention"/>
													</xsl:if>
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:KindContract/est:Exchange/est:PlaceDetention"/>
													</xsl:if>
													<br/>
												</td>
												<td class="graphMain" colspan="2">
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:KindContract/est:LeasingAgreement/est:PlaceDetention"/>
													</xsl:if>
													<xsl:if test="est:InfoContractDeliveryTerms/est:KindContract/est:Other">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:KindContract/est:Other/est:PlaceDetention"/>
													</xsl:if>
												</td>
											</tr>
											<xsl:variable name="xpath_Account_Type">
												<xsl:call-template name="get_xpath">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:Account/est:Type"/>
												</xsl:call-template>
											</xsl:variable>
											<tr>
												<td class="graphMain" style="width:50mm"> 30.Какой по счету является партия товара, ввозимого по рассматриваемому контракту </td>
												<td align="center" class="graphMain" style="width:35mm">единственной 
													<element xml_node="{$xpath_Account_Type}">
														<xsl:choose>
															<xsl:when test="est:InfoContractDeliveryTerms/est:Account/est:Type= '0'">
																<span align="right" class="normal2" style="width:5mm"> X</span>
															</xsl:when>
															<xsl:otherwise>
																<span class="normal2" style="width:5mm">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</span>
															</xsl:otherwise>
														</xsl:choose>
													</element>
												</td>
												<td align="center" class="graphMain" style="width:20mm">первой 
													<element xml_node="{$xpath_Account_Type}">
														<xsl:choose>
															<xsl:when test="est:InfoContractDeliveryTerms/est:Account/est:Type= '1'">
																<span align="right" class="normal2" style="width:5mm"> X</span>
															</xsl:when>
															<xsl:otherwise>
																<span class="normal2" style="width:5mm">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</span>
															</xsl:otherwise>
														</xsl:choose>
													</element>
												</td>
												<td class="graphMain" style="width:30mm">последней 
													<element xml_node="{$xpath_Account_Type}">
														<xsl:choose>
															<xsl:when test="est:InfoContractDeliveryTerms/est:Account/est:Type= '2'">
																<span align="right" class="normal2" style="width:5mm"> X</span>
															</xsl:when>
															<xsl:otherwise>
																<span class="normal2" style="width:5mm">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</span>
															</xsl:otherwise>
														</xsl:choose>
													</element>
												</td>
												<td align="center" class="graphMain" style="width:35mm">иной (указать)<br/>
													<xsl:if test="est:InfoContractDeliveryTerms/est:Account/est:Other">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:Account/est:Other"/>
													</xsl:if>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="1" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">31. Договор предусматривает:</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">(а) условие, при котором продажа одного наименования товара зависит от покупки товара другого наименования
												
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">(б) встречную поставку товаров покупателем продавцу
												
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">(в) поставку товаров со стороны Покупателя в пользу Продавца бесплатно или по сниженной цене
												
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">В случае ответа ДА хотя бы на один из подпунктов (а)-(в) указать подробности<br/>
													<xsl:if test="est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule= 'true'  or est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule= 't' or est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:Vaule= '1'">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:TermsContract/est:DeliveryGoodsBuyer/est:AnswerYES"/>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:if test="est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule= 'true' or est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule= 't' or est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:Vaule= '1'">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:TermsContract/est:CounterDelivery/est:AnswerYES"/>
														<xsl:text> </xsl:text>
													</xsl:if>
													<xsl:if test="est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule = 'true' or est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule = 't' or est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:Vaule = '1'">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:TermsContract/est:ProvidedDependPurchase/est:AnswerYES"/>
														<xsl:text> </xsl:text>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">32. Кем были предложены предусмотренные контрактом условия поставки
												
												</td>
												<td>
													<table border="0" cellspacing="0" style="width:47mm">
														<tbody>
															<xsl:call-template name="bool_with_td">
																<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:TermsDelivery/est:Seller"/>
															</xsl:call-template>
															<td align="center" class="graphMain" style="width:10mm">продавец</td>
															<xsl:call-template name="bool_with_td">
																<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:TermsDelivery/est:Buyer"/>
															</xsl:call-template>
															<td align="center" class="graphMain" style="width:10mm">покупатель</td>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">33. Кто осуществлял выбор вида транспорта и маршрута доставки
												
												</td>
												<td>
													<table border="0" cellspacing="0" style="width:47mm">
														<tbody>
															<xsl:call-template name="bool_with_td">
																<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:TransportRouteDelivery/est:Seller"/>
															</xsl:call-template>
															<td align="center" class="graphMain" style="width:10mm">продавец</td>
															<xsl:call-template name="bool_with_td">
																<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:TransportRouteDelivery/est:Buyer"/>
															</xsl:call-template>
															<td align="center" class="graphMain" style="width:10mm">покупатель</td>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="1" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">34. Заключается ли договор транспортного страхования в отношении товаров, поставляемых по контракту</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">нет
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:TransportInsurance/est:Not"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">да, с ответственностью за все риски
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:TransportInsurance/est:Risk"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">да, с ответственностью за частую аварию
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:TransportInsurance/est:SimpleAverage"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">да, без ответственностью за повреждения, кроме случаев крушения
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:TransportInsurance/est:Damage"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">да, на следующих условиях (указать подробности)
												<xsl:if test="est:InfoContractDeliveryTerms/est:TransportInsurance/est:OtherTerms = 'true' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:OtherTerms = '1' or est:InfoContractDeliveryTerms/est:TransportInsurance/est:OtherTerms = 't'">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:TransportInsurance/est:DescriptionOtherTerms"/>
													</xsl:if>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:TransportInsurance/est:OtherTerms"/>
												</xsl:call-template>
											</tr>
										</tbody>
									</table>
									<table border="1" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" style="width:136mm">35.Стоимость доставки до места назначения<br/>включена в цену сделки<br/> Если нет, то переход к графе 39
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:CostDeliveryIncludedPriceTransactions"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">36. Стоимость доставки оговаривалась при<br/>согласовании цены сделки
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:CostDeliverySpecified"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:136mm">37. Покупатель изучал конъюнктуру рынка услуг по<br/>доставке товара из страны отправления до <br/>места назначения
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:Delivery"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="1" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="3" style="width:170mm">38. Покупателю</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:80mm">известна точная стоимость доставки
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Value"/>
												</xsl:call-template>
												<xsl:text> </xsl:text>
												<td class="graphMain" style="width:85mm"> укажите ее величину <span class="normal">
														<xsl:if test="est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Value = 'true' or est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Value = 't' or est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Value = '1'">
															<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Quantity"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:CostDelivery/est:ExactAmount/est:Currency"/>
														</xsl:if>
													</span>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:80mm">известна примерная стоимость доставки
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Value"/>
												</xsl:call-template>
												<xsl:text> </xsl:text>
												<td class="graphMain" style="width:85mm"> укажите ее примерную величину <span class="normal">
														<xsl:if test="est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Value = 'true' or est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Value = '1' or est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Value = 't'">
															<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Quantity"/>
															<xsl:text> </xsl:text>
															<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:CostDelivery/est:ApproximateCost/est:Currency"/>
														</xsl:if>
													</span>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:80mm">не известна стоимость доставки
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:CostDelivery/est:NotKnown/est:Value"/>
												</xsl:call-template>
												<xsl:text> </xsl:text>
												<td class="graphMain" style="width:85mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">39. Какую часть цены сделки составляет стоимость доставки</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">менее 3%
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:Less3percent"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">примерно от 3% до 5%
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About3_5percent"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">примерно от 5% до 10%
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About5_10percent"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">примерно от 10% до 20%
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About10_20percent"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">примерно от 20% до 30%
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About20_30percent"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">примерно от 30% до 50%
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About30_50percent"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">примерно от 50% до 70%
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About50_70percent"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">примерно от 70% до 90%
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:About70_90percent"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">более 90%
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:PercentageDelivery/est:More90percent"/>
												</xsl:call-template>
											</tr>
										</tbody>
									</table>
									<table border="1" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" style="width:136mm">40. Соответствует ли стоимость доставки оцениваемых товаров обычному уровню цен, сложившихся на рынке транспортных услуг в отношении товаров того же класса или вида
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:ConformityCostDeliveryNormaPriceLevel"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">41. Когда осуществляется переход риска утраты/порчи товара на покупателя</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">на складе отправителя
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Warehouse"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">после передачи лицу,осуществляющему доставку товаров
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Disposition"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">в процессе доставки (указать подробности)
												<xsl:if test="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:ProcessDelivery = 'true' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:ProcessDelivery = '1' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:ProcessDelivery = 't'">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:CommentsProcessDelivery"/>
													</xsl:if>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:ProcessDelivery"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">в месте доставки (указать адрес)
												<xsl:if test="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:PlaceDelivery = 'true' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:PlaceDelivery = '1' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:PlaceDelivery = 't'">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:PostalCode"/>
														<xsl:text>, </xsl:text>
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:CountryCode"/>
														<xsl:text>, </xsl:text>
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:CounryName"/>
														<xsl:text>,</xsl:text>
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:Region"/>
														<xsl:text>, </xsl:text>
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:City"/>
														<xsl:text>, </xsl:text>
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:StreetHouse"/>
													</xsl:if>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:PlaceDelivery"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">в ином месте (указать адрес)
												<xsl:if test="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:OtherPlace = 'true' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:OtherPlace = '1' or est:InfoContractDeliveryTerms/est:RiskLossDamage/est:OtherPlace = 't'">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:PostalCode"/>
														<xsl:text>, </xsl:text>
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:CountryCode"/>
														<xsl:text>, </xsl:text>
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:CounryName"/>
														<xsl:text>,</xsl:text>
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:Region"/>
														<xsl:text>, </xsl:text>
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:City"/>
														<xsl:text>, </xsl:text>
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:Address/cat_ru:StreetHouse"/>
													</xsl:if>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:RiskLossDamage/est:OtherPlace"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">42. Когда осуществляется переход права собственности от Продавца к Покупателю</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">на день отгрузки
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:Property/est:DayShipping"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">на день оплаты
													
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:Property/est:DayPayment"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">иной день (указать подробности)
											<xsl:if test="est:InfoContractDeliveryTerms/est:Property/est:OtherDay = 'true' or est:InfoContractDeliveryTerms/est:Property/est:OtherDay = '1' or est:InfoContractDeliveryTerms/est:Property/est:OtherDay = 't'">
														<xsl:apply-templates select="est:InfoContractDeliveryTerms/est:Property/est:CommentsOtherDay"/>
													</xsl:if>
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:InfoContractDeliveryTerms/est:Property/est:OtherDay"/>
												</xsl:call-template>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain" style="width:30mm">Реализация товаров на внутреннем рынке </td>
								<td>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">43. Покупатель товаров:</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(а) реализует товары на внутреннем рынке Российской Федерации через собственную розничную сеть
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:BuyerGoods/est:OwnRetailNetwork"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(б) продает (планирует продать) товары одному - трем лицам
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:BuyerGoods/est:SellOne_ThreePersons"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(в) продает (планирует продать) товары разным лицам
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:BuyerGoods/est:SellDifferentPersons"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">(г) использует товары для собственного потребления или в собственной производственной деятельности (в этом случае переходите а графе 46)
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:BuyerGoods/est:OwnUse"/>
												</xsl:call-template>
											</tr>
										</tbody>
									</table>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" style="width:136mm">44. Цена реализации товара конечному потребителю на внутреннем рынке известна
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:FinalSellingPrice"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" style="width:122mm">45. Укажите цену реализации единицы товара на внутреннем рынке (в т.ч. планируемую) </td>
												<td class="graphMain" style="width:48mm">
													<xsl:apply-templates select="est:SaleGoodsDomesticMarket/est:UnitSellingPriceGoods"/>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:122mm">46. Укажите общий размер расходов Покупателя при реализации товаров на внутреннем рынке, которые должны быть включены в цену реализации для их покрытия   </td>
												<td class="graphMain" style="width:48mm">
													<xsl:apply-templates select="est:SaleGoodsDomesticMarket/est:Cost"/>
												</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:122mm">47. Укажите процент планируемой рентабельности сделки </td>
												<td class="graphMain" style="width:48mm">
													<xsl:apply-templates select="est:SaleGoodsDomesticMarket/est:Profitability"/>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="0" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" style="width:136mm">48. Известна ли Покупателю рыночная цена в Российской Федерации товаров того же класса или вида при продаже их конечному потребителю? - Если ДА, указать величину в графе 49
												</td>
												<td class="graphMain">
													<xsl:call-template name="bool_with_tbl">
														<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">49. Укажите величину
												<xsl:if test="est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value = 'false' or est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value = 'f' or est:SaleGoodsDomesticMarket/est:MarketPrice/est:Value = '0'">
														<xsl:apply-templates select="est:SaleGoodsDomesticMarket/est:MarketPrice/est:ValueMarketPrice "/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates select="est:SaleGoodsDomesticMarket/est:MarketPrice/est:CurrencyMarketPrice "/>
													</xsl:if>
												</td>
											</tr>
										</tbody>
									</table>
									<table border="1" cellspacing="0" style="width:170mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="2" style="width:170mm">50. Цена товара на внутреннем рынке Российской Федерации превышает заявленную таможенную стоимость, увеличенную на размер таможенных платежей</td>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">менее чем на 30%
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:Less30percent"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">примерно от 30% до 50%
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About30_50percent"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">примерно от 50% до 100%
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About50_100percent"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">примерно в 3 раза
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About3Times"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">примерно в 5 раза
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About5Times"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">примерно в 10 раза
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:About10Times"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">от 10 до 100 раз
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:Times10_100"/>
												</xsl:call-template>
											</tr>
											<tr>
												<td class="graphMain" style="width:165mm">более чем в 100 раз
												</td>
												<xsl:call-template name="bool_with_td">
													<xsl:with-param name="node" select="est:SaleGoodsDomesticMarket/est:ExcessCustomsCost/est:More100Times"/>
												</xsl:call-template>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<table border="0" cellspacing="0" style="width:190mm">
									<tbody>
										<td align="left" class="graphMain" style="width:95mm">Дополнительные данные <span class="normal">
												<xsl:apply-templates select="est:Comments"/>
											</span>
										</td>
										<td align="right" class="graphMain" style="width:95mm">Подпись <span class="normal">
												<xsl:apply-templates select="est:PersonSignature/cat_ru:PersonSurname"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="est:PersonSignature/cat_ru:PersonName"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="est:PersonSignature/cat_ru:PersonMiddleName"/>
												<xsl:text> </xsl:text>
												<xsl:if test="est:PersonSignature/cat_ru:PersonPost">/
										<xsl:apply-templates select="est:PersonSignature/cat_ru:PersonPost"/>/ </xsl:if>
												<xsl:if test="est:PersonSignature/cat_ru:IssueDate">
													<xsl:call-template name="russian_date">
														<xsl:with-param name="dateIn" select="est:PersonSignature/cat_ru:IssueDate"/>
													</xsl:call-template>
												</xsl:if>
											</span>
										</td>
									</tbody>
								</table>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
