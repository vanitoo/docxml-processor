<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФСВТС России от 13 марта 2015 г. № 20-од «Об утверждении Порядка отнесения товаров, а также информации, работ, услуг, результатов интеллектуальной деятельности к продукции военного назначения и выдачи Федеральной службой по военно-техническому сотрудничеству соответствующих заключений»,
Приказ ФТС России № 1218 от 25 июля 2017 года "Об утверждении Временного порядка получения, хранения и использования информации, поступающей из Федеральной службы по военно-техническому сотрудничеству",
приложение № 7 из "УТОВиЭК 2016 № 46547 Бланки ФСТЭК.tif" (Письмо УТОВиЭК №14-153/46547 от 14.09.2016)
код вида документа 01163-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:fscgnm="urn:customs.ru:Information:SQDocuments:FsVtsConclGoodsNotMilitary:5.24.0">
	<!-- Шаблон для типа FsVtsConclGoodsNotMilitaryType -->
	<xsl:template match="fscgnm:FsVtsConclGoodsNotMilitary">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center">
									<font size="4">
										Федеральная служба по военно-техническому сотрудничеству
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr align="center">
								<td width="30%">
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="fscgnm:ConclDate"/></xsl:call-template>
								</td>
								<td width="40%"></td>
								<td width="30%">
									<xsl:if test="fscgnm:ConclNum">
										<xsl:text>№ </xsl:text>
										<xsl:value-of select="fscgnm:ConclNum"/>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr align="center">
								<td><b>Заключение</b></td>
							</tr>
							<tr>
								<td align="right">
									<xsl:choose>
										<xsl:when test="fscgnm:Status = 1">Действует</xsl:when>
										<xsl:when test="fscgnm:Status = 2">Действие прекращено</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td align="right">
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="fscgnm:ChangeStatusDate"/></xsl:call-template>
								</td>
							</tr>

							<tr>
								<td>
									<br/>
									<xsl:apply-templates select="fscgnm:Organization"/>
									<xsl:if test="fscgnm:CustomsProcedure">
										<br/>
										<xsl:text>Направление перемещения: </xsl:text>
										<xsl:value-of select="fscgnm:CustomsProcedure"/>
									</xsl:if>
									<xsl:if test="fscgnm:GoodsDescription">
										<br/>
										<xsl:text>Товар: </xsl:text>
										<xsl:apply-templates select="fscgnm:GoodsDescription"/>
									</xsl:if>
									<xsl:if test="fscgnm:Contract/fscgnm:Number">
										<br/>
										<xsl:text>Номер контракта: </xsl:text>
										<xsl:value-of select="fscgnm:Contract/fscgnm:Number"/>
									</xsl:if>
									<xsl:if test="fscgnm:Contract/fscgnm:Date">
										<br/>
										<xsl:text>Дата контракта: </xsl:text>
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="fscgnm:Contract/fscgnm:Date"/></xsl:call-template>
									</xsl:if>
									<xsl:if test="fscgnm:ExpiryDate">
										<br/>
										<xsl:text>Срок действия заключения: </xsl:text>
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="fscgnm:ExpiryDate"/></xsl:call-template>
									</xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered">№ п/п</td>
								<td class="bordered">Обозначение продукции</td>
								<td class="bordered">Область применения</td>
								<td class="bordered">Реквизиты документа, в котором установлено обозначение продукции</td>
								<td class="bordered">Серийный (заводской) номер продукции</td>
								<td class="bordered">Количество продукции</td>
								<td class="bordered">Относится к продукции военного назначения</td>
								<td class="bordered">Рекомендовано обращение во ФСТЭК</td>
							</tr>
							<xsl:for-each select="fscgnm:Goods">
								<tr align="center" valign="top">
									<td class="bordered">
										<xsl:value-of select="position()"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="fscgnm:GoodsDesignation"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="fscgnm:GoodsDescription"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="fscgnm:DocRequisites"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="fscgnm:SerialNumbers"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="fscgnm:GoodsQuantity"/>
									</td>
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="fscgnm:MilitarySign=1 or fscgnm:MilitarySign='true'">да</xsl:when>
											<xsl:when test="fscgnm:MilitarySign=0 or fscgnm:MilitarySign='false'">нет</xsl:when>
										</xsl:choose>
									</td>
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="fscgnm:RecommendationSign=1 or fscgnm:RecommendationSign='true'">да</xsl:when>
											<xsl:when test="fscgnm:RecommendationSign=0 or fscgnm:RecommendationSign='false'">нет</xsl:when>
										</xsl:choose>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:apply-templates select="fscgnm:AuthorizedPerson"/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="fscgnm:Organization">
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:if test="not(RUScat_ru:OrganizationName) and RUScat_ru:ShortName">
			<xsl:value-of select="RUScat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Address">
			<xsl:text> адрес: </xsl:text>
			<xsl:apply-templates select="RUScat_ru:Address"/>
		</xsl:if>
	</xsl:template>

	
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
