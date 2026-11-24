<?xml version="1.0" encoding="UTF-8"?>
<!-- Приказ ФТС России от 06.02.2019 № 194 
IDDoc = 'ОЗ' - Приложение 5 - Решение об отказе в рассмотрении заявления о принятии решения о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени
IDDoc = 'ОЕ' Приложение 8 - Решение об отказе в принятии решения о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени
IDDoc = 'КР' Приложение 10 - Решение о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени
IDDoc = 'ОИ' Приложение 14 - Решение об отказе в рассмотрении заявления о внесении изменений в решение о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени
IDDoc = 'ИЗ' Приложение 16 - Решение о внесении изменений в решение о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени
IDDoc = 'ПД' Приложение 18 - Решение о прекращении действия решения о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени
-->
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:gcd="urn:customs.ru:Information:CustomsDocuments:GoodsClassificationDecision:5.28.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="/">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Решение о классификации товара</title>
				<style type="text/css">
                    body {
                        background: #cccccc;
                        font-family: Times New Roman ;
                        line-height: 1;
                    }

                    div.pagePortrait {
                        width: 210mm;
                        margin: 10pt auto;
                        padding: 10mm;
                        padding-left: 10mm;
                        background: #ffffff;
                        border: solid .5pt #000000;

                    }

                    h2 {
                        text-align: center;
                    }

                    table {
                        border: 1px solid #000000;
                        vertical-align: top;
                        border-collapse: collapse;
                    }

                    td {
                        vertical-align: top;
                        border: 1px solid #000000;
                    }

                    div.pagePortrait table tbody tr td {
                        padding: 10px 5px;
                    }

                    table.custPerson {
                        width: 100%;
                        border-collapse: separate;
                    }

                    table.custPerson, table.custPerson tr td {
                        border: none;
                        margin-top: 10px;
                        border-spacing: 8px 0;
                    }

                    table.custPerson tr td.graphUnderline {
                        padding: 0 6px;
                    }

                    table.custPerson tr td.graphUnderline {
                        border: none;
                        border-bottom: 1px dotted black;
                        text-align: center;
                        vertical-align: bottom;
                    }

                    td.graph, table.custPerson tr td.graph {
                        border: none;
                        font-size: 90%;
                        text-align: center;
                        padding: 0;
                        spacing: 0;
                        white-space: normal;
                    }

                    span1 {
                        text-decoration: underline;
                    }
                    
                    .header{
						text-align: center;
                    }


					.graphName{
					font-size:10pt;
					font-weight: bold;
					text-align: left;
					}

					.graphValue{
					font-size:10pt;
					text-align: center;
					}

                    @media print {
                        div.pagePortrait {
                            border: none;
                        }
                    }
                </style>
			</head>
			<body>
				<xsl:apply-templates select="gcd:GoodsClassificationDecision"/>
			</body>
		</html>
	</xsl:template>
	<!-- Документы -->
	<xsl:template match="gcd:Documents">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
		   № <xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
		   от <xsl:call-template name="dateRussian">
				<xsl:with-param name="text" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="position()!=last()">
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- Характеристики товара -->
	<xsl:template match="gcd:GoodsInformation">
		марка <xsl:value-of select="gcd:GoodsMark"/>
		<xsl:if test="gcd:GoodsModel">
			<xsl:text>, модель </xsl:text>
			<xsl:value-of select="gcd:GoodsModel"/>
		</xsl:if>
		<xsl:if test="gcd:GoodsMarking">
			<xsl:text>, артикул </xsl:text>
			<xsl:value-of select="gcd:GoodsMarking"/>
		</xsl:if>
		<xsl:if test="gcd:GoodsOtherInfo">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="gcd:GoodsOtherInfo"/>
		</xsl:if>
	</xsl:template>
	<!-- Адрес -->
	<xsl:template match="cat_ru:Address">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Декларант -->
	<xsl:template match="gcd:Declarant">
		<xsl:if test="gcd:Chief">
			<xsl:if test="gcd:Chief/cat_ru:PersonPost">
				<xsl:value-of select="gcd:Chief/cat_ru:PersonPost"/>
				<xsl:text>: </xsl:text>
			</xsl:if>
			<xsl:value-of select="gcd:Chief/cat_ru:PersonSurname"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="gcd:Chief/cat_ru:PersonName"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="gcd:Chief/cat_ru:PersonMiddleName"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
			<br/>
		</xsl:if>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:Address">
			<xsl:apply-templates select="cat_ru:Address"/>
		</xsl:if>
		<br>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
		   ОГРН <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
			</xsl:if>
			<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
		   ИНН <xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
			</xsl:if>
		</br>
	</xsl:template>
	<!-- Регистраицонный номер-->
	<xsl:template match="gcd:RegistryNumber|gcd:PrecedingDecisionRegNumber">
		<xsl:value-of select="gcd:IDDoc"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="gcd:CountryCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="gcd:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring(gcd:Date, 3, 2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="gcd:SerialNumber"/>
	</xsl:template>
	<!-- Подпись должностного лица -->
	<xsl:template match="gcd:CustomsPerson">
		<table class="custPerson">
			<tbody>
				<tr>
					<td class="graphUnderline" style="width: 30%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td style="width: 5%;"/>
					<td class="graphUnderline" style="width: 30%">
						<br/>
					</td>
					<td style="width: 5%;"/>
					<td class="graphUnderline" style="width: 30%">
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
				<tr>
					<td style="font-size:9pt" class="graph">(должность)</td>
					<td/>
					<td style="font-size:9pt" class="graph">(подпись)</td>
					<td/>
					<td style="font-size:9pt" class="graph">(Ф.И.О.)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Отображает название месяца по его номеру -->
	<xsl:template name="monthName">
		<xsl:param name="month"/>
		<xsl:choose>
			<xsl:when test="$month = '01'">января</xsl:when>
			<xsl:when test="$month = '02'">февраля</xsl:when>
			<xsl:when test="$month = '03'">марта</xsl:when>
			<xsl:when test="$month = '04'">апреля</xsl:when>
			<xsl:when test="$month = '05'">мая</xsl:when>
			<xsl:when test="$month = '06'">июня</xsl:when>
			<xsl:when test="$month = '07'">июля</xsl:when>
			<xsl:when test="$month = '08'">августа</xsl:when>
			<xsl:when test="$month = '09'">сентября</xsl:when>
			<xsl:when test="$month = '10'">октября</xsl:when>
			<xsl:when test="$month = '11'">ноября</xsl:when>
			<xsl:when test="$month = '12'">декабря</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!--Шаблон для отображения даты по стандартам русской локали-->
	<xsl:template name="dateRussian">
		<xsl:param name="text"/>
		<xsl:choose>
			<xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
				<xsl:value-of select="substring($text,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($text,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($text,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--Шаблон для отображения даты по стандартам русской локали (месяц прописью)-->
	<xsl:template name="date">
		<xsl:param name="text"/>
		<xsl:choose>
			<xsl:when test="substring($text, 5, 1) = '-' and substring($text, 8, 1) = '-'">
				<xsl:text>«</xsl:text>
				<!--span-->
				<xsl:value-of select="substring($text,9,2)"/>
				<xsl:text>» </xsl:text>
				<xsl:call-template name="monthName">
					<xsl:with-param name="month" select="substring($text,6,2)"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($text,1,4)"/>
				<!--/span-->
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон отображения даты -->
	<xsl:template match="cat_ru:IssueDate">
		<b>Дата</b>
		<xsl:text> </xsl:text>
		<xsl:call-template name="date">
			<xsl:with-param name="text" select="."/>
		</xsl:call-template>
	</xsl:template>
	<!-- таблица приложения -->
	<xsl:template match="gcd:ComponentList" mode="application">
		<tr>
			<td class="graphValue" align="center">
				<xsl:value-of select="RUDECLcat:IDNumber"/>
			</td>
			<td style="text-align:left" class="graphValue">
				<xsl:value-of select="RUDECLcat:ComponentName"/>
			</td>
			<td align="center" class="graphValue">
				<xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/>
			</td>
			<td align="center" class="graphValue">
				<xsl:value-of select="catESAD_cu:SupplementaryQuantity/catESAD_cu:GoodsQuantity"/>
			</td>
			<td align="center" class="graphValue">
				<xsl:value-of select="catESAD_cu:SupplementaryQuantity/catESAD_cu:MeasureUnitQualifierName"/>
			</td>
			<td align="center" class="graphValue">
				<xsl:value-of select="catESAD_cu:KGWeight"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Основной документ -->
	<xsl:template match="gcd:GoodsClassificationDecision">
		<div class="pagePortrait">
			<xsl:if test="gcd:RegistryNumber/gcd:IDDoc='КР'">
				<table width="100%">
					<tbody>
						<tr>
							<td colspan="6" style="text-align:center;font-size:11pt;border:0px;border-bottom:1px solid black;">
								<b>
						  Решение<br/>о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
							<xsl:choose>
										<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
										<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
										<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
									</xsl:choose>
						  которого предполагается различными товарными партиями в течение установленного периода времени
						  </b>
							</td>
						</tr>
						<tr>
							<td width="50%" colspan="3">
								<span class="graphName">1. Наименование таможенного органа, принявшего решение о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени (далее - решение о классификации товара, перемещаемого в виде компонентов)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:value-of select="gcd:Customs/cat_ru:Code"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="gcd:Customs/cat_ru:OfficeName"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td rowspan="2" colspan="3">
								<span class="graphName">
						 3. Сведения о заявителе</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px"/>
										</tr>
									</tbody>
								</table>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:Declarant"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<span class="graphName">
						 2. Наименование таможенного органа, где будет осуществляться декларирование товара</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px"/>
										</tr>
									</tbody>
								</table>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:value-of select="gcd:CustomsDecl/cat_ru:Code"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="gcd:CustomsDecl/cat_ru:OfficeName"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<span class="graphName">
						4. Регистрационный номер</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td valign="bottom" align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:RegistryNumber"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td colspan="3">
								<span class="graphName">
						5. Дата принятия решения о классификации товара, перемещаемого в виде компонентов (число, месяц, год)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td valign="bottom" align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:RegistryNumber/gcd:Date"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<span class="graphName">
					  6. Наименование товара</span>
								<br/>
								<span class="graphValue">
									<xsl:if test="gcd:GoodsDescription">
										<xsl:for-each select="gcd:GoodsDescription">
											<xsl:value-of select="."/>
										</xsl:for-each>
										<br/>
									</xsl:if>
									<xsl:for-each select="gcd:GoodsInformation">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2" width="33%">
								<span class="graphName">
							7. 10-значный классификационный код товара в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности Евразийского экономического союза (далее по форме - ТН ВЭД ЕАЭС)</span>
								<br/>
								<span class="graphValue">
									<xsl:value-of select="substring(gcd:GoodsTNVED,1,3)"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(gcd:GoodsTNVED,4,2)"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(gcd:GoodsTNVED,6,3)"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="substring(gcd:GoodsTNVED,9,2)"/>
								</span>
							</td>
							<td colspan="2" width="33%">
								<span class="graphName">
							8. Обоснование решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<span class="graphValue">
									<xsl:apply-templates select="gcd:InterpretationRules"/>
								</span>
							</td>
							<td colspan="2">
								<span class="graphName">
							9. Вид таможенной процедуры, под которую будет помещен товар</span>
								<br/>
								<span class="graphValue">
									<xsl:choose>
										<xsl:when test="gcd:CustomsModeCode='10'">Экспорт</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='21'">Переработка вне таможенной территории</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='23'">Временный вывоз</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='31'">Реэкспорт</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='40'">Выпуск для внутреннего потребления</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='51'">Переработка на таможенной территории</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='53'">Временный ввоз (допуск)</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='60'">Реимпорт</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='70'">Таможенный склад</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='77'">Свободный склад</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='78'">Свободная таможенная зона</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='80'">Таможенный транзит</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='90'">Специальная таможенная процедура</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='91'">Переработка для внутреннего потребления</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='93'">Уничтожение</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='94'">Отказ в пользу государства</xsl:when>
										<xsl:when test="gcd:CustomsModeCode='96'">Беспошлинная торговля</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="gcd:CustomsModeCode"/>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<span class="graphName">
						10. Реквизиты документов, которые подтверждают совершение внешнеэкономической сделки и в соответствии с которыми будет осуществляться 
						<xsl:choose>
										<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
										<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
										<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
									</xsl:choose>
						компонентов товара</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td valign="bottom" align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:Documents"/>
												<xsl:if test="gcd:GoodsDirection='ИМ' and (gcd:StartDelivery or gcd:TermOfDelivery)">
													<br/>
													<xsl:if test="gcd:StartDelivery">
								начало поставки товара:
								<xsl:call-template name="dateRussian">
															<xsl:with-param name="text" select="gcd:StartDelivery"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="gcd:TermOfDelivery">
														<xsl:if test="gcd:StartDelivery">; </xsl:if>
								окончание поставки товара:
								<xsl:call-template name="dateRussian">
															<xsl:with-param name="text" select="gcd:TermOfDelivery"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<span class="graphName">
							11. Приложение (перечень компонентов товара, включающий в себя: наименования компонентов, в том числе частей, составляющих отдельный компонент товара; количество или вес компонентов, в том числе частей, составляющих отдельный компонент товара, в единицах измерения, применяемых в ТН ВЭД ЕАЭС)</span>
								<br/>
								<span class="graphValue">
							На 
							<xsl:choose>
										<xsl:when test="gcd:ComponentListPages">
											<xsl:value-of select="gcd:ComponentListPages"/>
										</xsl:when>
										<xsl:otherwise>
											<u>
												<xsl:text>&#160;&#160;&#160;&#160;</xsl:text>
											</u>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:text> л.   в </xsl:text>
									<xsl:choose>
										<xsl:when test="gcd:ComponentListCopies">
											<xsl:value-of select="gcd:ComponentListCopies"/>
										</xsl:when>
										<xsl:otherwise>
											<u>
												<xsl:text>&#160;&#160;&#160;&#160;</xsl:text>
											</u>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:text> экз.</xsl:text>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<span class="graphName">
							12. Служебные отметки</span>
								<br/>
								<span class="graphValue">
									<xsl:apply-templates select="gcd:Mark"/>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<span class="graphName">
							13. Должностное лицо таможенного органа, принявшее решение о классификации товара, перемещаемого в виде компонентов
							</span>
								<xsl:apply-templates select="gcd:CustomsPerson"/>
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ОЗ'">
				<table>
					<tbody>
						<tr>
							<td colspan="2" style="text-align:center;font-size:11pt;border:0px;border-bottom:1px solid black;">
								<b>
						  Решение<br/>об отказе в рассмотрении заявления о принятии решения о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
							<xsl:choose>
										<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
										<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
										<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
									</xsl:choose>
						  которого предполагается различными товарными партиями в течение установленного периода времени<br/>
								</b>
							</td>
						</tr>
						<tr>
							<td width="50%">
								<span class="graphName">
						 1. Наименование таможенного органа, принявшего решение об отказе в рассмотрении заявления о принятии решения о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени (далее - решение о классификации товара, перемещаемого в виде компонентов)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:value-of select="gcd:Customs/cat_ru:Code"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="gcd:Customs/cat_ru:OfficeName"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
						 2. Сведения о заявителе</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:Declarant"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<span class="graphName">
						 3. Регистрационный номер решения об отказе в рассмотрении заявления о принятии решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:RegistryNumber"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
						 4. Дата принятия решения об отказе в рассмотрении заявления о принятии решения о классификации товара, перемещаемого в виде компонентов (число, месяц, год)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:RegistryNumber/gcd:Date"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<span class="graphName">
						5. Исходящий номер заявления о принятии решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:value-of select="gcd:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
						6. Дата исходящего заявления о принятии решения о классификации товара, перемещаемого в виде компонентов (число, месяц, год)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:ApplicationRegistration/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
					  7. Наименование товара, указанного в заявлении о принятии решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<span class="graphValue">
									<xsl:if test="gcd:GoodsDescription">
										<xsl:for-each select="gcd:GoodsDescription">
											<xsl:value-of select="."/>
										</xsl:for-each>
										<br/>
									</xsl:if>
									<xsl:for-each select="gcd:GoodsInformation">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							8. Основание(я) принятия решения об отказе в рассмотрении заявления о принятии решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<span class="graphValue">
									<xsl:apply-templates select="gcd:InterpretationRules"/>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							9. Причины(а) принятия решения об отказе в рассмотрении заявления о принятии решения о классификации товара, перемещаемого в виде компонентов:</span>
								<br/>
								<span class="graphValue">
									<xsl:for-each select="gcd:ReasonsForDecision">
										<xsl:value-of select="gcd:Number"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="gcd:Text"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							10. Служебные отметки</span>
								<br/>
								<span class="graphValue">
									<xsl:apply-templates select="gcd:Mark"/>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							11. Должностное лицо таможенного органа, принявшее решение об отказе в рассмотрении заявления о принятии решения о классификации товара, перемещаемого в виде компонентов
							</span>
								<xsl:apply-templates select="gcd:CustomsPerson"/>
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ОЕ'">
				<table>
					<tbody>
						<tr>
							<td colspan="2" style="text-align:center;font-size:11pt;border:0px;border-bottom:1px solid black;">
								<b>
						  Решение<br/>об отказе в принятии решения о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
							<xsl:choose>
										<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
										<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
										<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
									</xsl:choose>
						  которого предполагается различными товарными партиями в течение установленного периода времени<br/>
								</b>
							</td>
						</tr>
						<tr>
							<td width="50%">
								<span class="graphName">
						 1. Наименование таможенного органа, принявшего решение об отказе в принятии решения о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени (далее - решение о классификации товара, перемещаемого в виде компонентов)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:value-of select="gcd:Customs/cat_ru:Code"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="gcd:Customs/cat_ru:OfficeName"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
						 2. Сведения о заявителе</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:Declarant"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<span class="graphName">
						 3. Регистрационный номер решения об отказе в принятии решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:RegistryNumber"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
						 4. Дата принятия решения об отказе в принятии решения о классификации товара, перемещаемого в виде компонентов (число, месяц, год)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:RegistryNumber/gcd:Date"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<span class="graphName">
						5. Исходящий номер заявления о принятии решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:value-of select="gcd:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
						6. Дата исходящего заявления о принятии решения о классификации товара, перемещаемого в виде компонентов (число, месяц, год)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:ApplicationRegistration/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
					  7. Наименование товара, указанного в заявлении о принятии решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<span class="graphValue">
									<xsl:if test="gcd:GoodsDescription">
										<xsl:for-each select="gcd:GoodsDescription">
											<xsl:value-of select="."/>
										</xsl:for-each>
										<br/>
									</xsl:if>
									<xsl:for-each select="gcd:GoodsInformation">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							8. Основание(я) принятия решения об отказе в принятии решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<span class="graphValue">
									<xsl:apply-templates select="gcd:InterpretationRules"/>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							9. Причины(а) принятия решения об отказе в принятии решения о классификации товара, перемещаемого в виде компонентов:</span>
								<br/>
								<span class="graphValue">
									<xsl:for-each select="gcd:ReasonsForDecision">
										<xsl:value-of select="gcd:Number"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="gcd:Text"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							10. Служебные отметки</span>
								<br/>
								<span class="graphValue">
									<xsl:apply-templates select="gcd:Mark"/>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							11. Должностное лицо таможенного органа, принявшее решение об отказе в принятии решения о классификации товара, перемещаемого в виде компонентов
							</span>
								<xsl:apply-templates select="gcd:CustomsPerson"/>
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ИЗ'">
				<table>
					<tbody>
						<tr>
							<td colspan="6" style="text-align:center;font-size:11pt;border:0px;border-bottom:1px solid black;">
								<b>
						  Решение<br/>о внесении изменений в решение о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
							<xsl:choose>
										<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
										<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
										<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
									</xsl:choose>
						  которого предполагается различными товарными партиями в течение установленного периода времени
						  </b>
							</td>
						</tr>
						<tr>
							<td width="50%" colspan="3">
								<span class="graphName">
						 1. Наименование таможенного органа, принявшего решение о внесении изменений в решение о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени (далее - решение о классификации товара, перемещаемого в виде компонентов)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:value-of select="gcd:Customs/cat_ru:Code"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="gcd:Customs/cat_ru:OfficeName"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td colspan="3">
								<span class="graphName">
						 2. Сведения о заявителе</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:Declarant"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<span class="graphName">
						 3. Регистрационный номер решения о внесении изменений в решение о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:RegistryNumber"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td colspan="3">
								<span class="graphName">
						 4. Дата принятия решения о внесении изменений в решение о классификации товара, перемещаемого в виде компонентов (число, месяц, год)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:RegistryNumber/gcd:Date"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<span class="graphName">
						5. Регистрационный номер решения о классификации товара, перемещаемого в виде компонентов, в которое вносятся изменения</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:PrecedingDecisionRegNumber"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td colspan="3">
								<span class="graphName">
						6. Дата принятия решения о классификации товара, в которое вносятся изменения (число, месяц, год)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:PrecedingDecisionRegNumber/gcd:Date"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<span class="graphName">
					  7. Наименование товара, указанного в заявлении о принятии решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<span class="graphValue">
									<xsl:if test="gcd:GoodsDescription">
										<xsl:for-each select="gcd:GoodsDescription">
											<xsl:value-of select="."/>
										</xsl:for-each>
										<br/>
									</xsl:if>
									<xsl:for-each select="gcd:GoodsInformation">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="6" style="padding:0;">
								<table style="margin:0;border:0;">
									<tbody>
										<tr>
											<td width="33%" style="border:0px solid white;border-right:1px solid black;">
												<span class="graphName">
											8. Номер графы решения о классификации товара, перемещаемого в виде компонентов
										</span>
											</td>
											<td width="33%" style="border:0px solid white;border-right:1px solid black;">
												<span class="graphName">
											9. Сведения, указанные в изменяемой графе решения о классификации товара, перемещаемого в виде компонентов
										</span>
											</td>
											<td width="34%" style="border:0px solid white;">
												<span class="graphName">
											10. Измененная редакция графы решения о классификации товара, перемещаемого в виде компонентов
										</span>
											</td>
										</tr>
										<xsl:for-each select="gcd:ModificationContent">
											<tr>
												<td width="33%" style="border:0px solid white;border-right:1px solid black;">
													<span class="graphValue">
												8.<xsl:value-of select="position()"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="gcd:IDGrafa"/>
													</span>
												</td>
												<td width="33%" style="border:0px solid white;border-right:1px solid black;">
													<span class="graphValue">
												9.<xsl:value-of select="position()"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="gcd:Original"/>
													</span>
												</td>
												<td width="34%" style="border:0px solid white;">
													<span class="graphValue">
												10.<xsl:value-of select="position()"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="gcd:Modification"/>
													</span>
												</td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<span class="graphName">
						11. Основания(ие) внесения изменений в решение о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<span class="graphValue">
									<xsl:apply-templates select="gcd:InterpretationRules"/>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<span class="graphName">
						12. Причины(а) внесения изменений в решение о классификации товара, перемещаемого в виде компонентов:</span>
								<br/>
								<span class="graphValue">
									<!--xsl:for-each select="gcd:ReasonsForDecision">
										<xsl:value-of select="gcd:Number"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="gcd:Text"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each-->
									<xsl:for-each select="gcd:TypeChange">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<span class="graphName">
						13. Приложение к решению о внесении изменений в приложение к решению о классификации товара (перечень компонентов товара):</span>
								<span class="graphValue">
									<xsl:if test="gcd:ComponentList/RUDECLcat:ChangeAction='1'">
										<br/>
										<xsl:text>13.1 Дополнение компонентами товара: (Приложение № 1)</xsl:text>
									</xsl:if>
									<xsl:if test="gcd:ComponentList/RUDECLcat:ChangeAction='2'">
										<br/>
										<xsl:text>13.2 Изменение компонентов товара: (Приложение № 2)</xsl:text>
									</xsl:if>
									<xsl:if test="gcd:ComponentList/RUDECLcat:ChangeAction='3'">
										<br/>
										<xsl:text>13.3 Исключение компонентов товара: (Приложение №3)</xsl:text>
									</xsl:if>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<span class="graphName">
						14. Срок вступления в силу решения о внесении изменений в решение о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:DateEntryIntoForce"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<span class="graphName">
							15. Служебные отметки</span>
								<br/>
								<span class="graphValue">
									<xsl:apply-templates select="gcd:Mark"/>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<span class="graphName">
						 16. Должностное лицо таможенного органа, принявшее решение о внесении изменений в решение о классификации товара, перемещаемого в виде компонентов
						 </span>
								<xsl:apply-templates select="gcd:CustomsPerson"/>
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ОИ'">
				<table>
					<tbody>
						<tr>
							<td colspan="2" style="text-align:center;font-size:11pt;border:0px;border-bottom:1px solid black;">
								<b>
						  Решение<br/>об отказе в рассмотрении заявления о внесении изменений в решение о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
							<xsl:choose>
										<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
										<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
										<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
									</xsl:choose>
						  которого предполагается различными товарными партиями в течение установленного периода времени
						  <br/>
								</b>
							</td>
						</tr>
						<tr>
							<td width="50%">
								<span class="graphName">
						 1. Наименование таможенного органа, принявшего решение об отказе в рассмотрении заявления о внесении изменений в решение о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени (далее - решение о классификации товара, перемещаемого в виде компонентов)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:value-of select="gcd:Customs/cat_ru:Code"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="gcd:Customs/cat_ru:OfficeName"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
						 2. Сведения о заявителе</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:Declarant"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<span class="graphName">
						 3. Регистрационный номер решения об отказе в рассмотрении заявления о внесении изменений в решение о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:RegistryNumber"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
						 4. Дата принятия решения об отказе в рассмотрении заявления о внесении изменений в решение о классификации товара, перемещаемого в виде компонентов (число, месяц, год)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:RegistryNumber/gcd:Date"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<span class="graphName">
						5. Исходящий номер заявления о внесении изменений в решение о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:value-of select="gcd:ApplicationRegistration/cat_ru:PrDocumentNumber"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
						6. Дата исходящего заявления о внесении изменений в решение о классификации товара, перемещаемого в виде компонентов (число, месяц, год)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:ApplicationRegistration/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<span class="graphName">
							7. Регистрационный номер решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:PrecedingDecisionRegNumber"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
							8. Дата принятия решения о классификации товара, перемещаемого в виде компонентов (число, месяц, год)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:PrecedingDecisionRegNumber/gcd:Date"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
					  9. Наименование товара, указанное в решении о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<span class="graphValue">
									<xsl:if test="gcd:GoodsDescription">
										<xsl:for-each select="gcd:GoodsDescription">
											<xsl:value-of select="."/>
										</xsl:for-each>
										<br/>
									</xsl:if>
									<xsl:for-each select="gcd:GoodsInformation">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							10. Основание(я) принятия решения об отказе в рассмотрении заявления о внесении изменений в решение о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<span class="graphValue">
									<xsl:apply-templates select="gcd:InterpretationRules"/>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							11. Причины(а) принятия решения об отказе в рассмотрении заявления о внесении изменений в решение о классификации товара, перемещаемого в виде компонентов:</span>
								<br/>
								<span class="graphValue">
									<xsl:for-each select="gcd:ReasonsForDecision">
										<xsl:apply-templates select="gcd:Text"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							12. Служебные отметки</span>
								<br/>
								<span class="graphValue">
									<xsl:apply-templates select="gcd:Mark"/>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							13. Должностное лицо таможенного органа, принявшее решение об отказе в рассмотрении заявления о внесении изменений в решение о классификации товара, перемещаемого в виде компонентов
							</span>
								<xsl:apply-templates select="gcd:CustomsPerson"/>
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ПД'">
				<table>
					<tbody>
						<tr>
							<td colspan="2" style="text-align:center;font-size:11pt;border:0px;border-bottom:1px solid black;">
								<b>
						  Решение<br/>о прекращении действия решения о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
							<xsl:choose>
										<xsl:when test="gcd:GoodsDirection='ИМ'">ввоз </xsl:when>
										<xsl:when test="gcd:GoodsDirection='ЭК'">вывоз </xsl:when>
										<xsl:otherwise>ввоз или вывоз </xsl:otherwise>
									</xsl:choose>
						  которого предполагается различными товарными партиями в течение установленного периода времени
							<br/>
								</b>
							</td>
						</tr>
						<tr>
							<td width="50%">
								<span class="graphName">
						 1. Наименование таможенного органа, принявшего решение о прекращении действия решения о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени (далее - решение о классификации товара, перемещаемого в виде компонентов)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:value-of select="gcd:Customs/cat_ru:Code"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="gcd:Customs/cat_ru:OfficeName"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
						 2. Сведения о заявителе</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:Declarant"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<span class="graphName">
						 3. Регистрационный номер решения о прекращении действия решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:RegistryNumber"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
						 4. Дата принятия решения о прекращении действия решения о классификации товара, перемещаемого в виде компонентов (число, месяц, год)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:RegistryNumber/gcd:Date"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<span class="graphName">
						5. Регистрационный номер решения о классификации товара, перемещаемого в виде компонентов, действие которого прекращается</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:apply-templates select="gcd:PrecedingDecisionRegNumber"/>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<span class="graphName">
						6. Дата принятия решения о классификации товара, перемещаемого в виде компонентов, действие которого прекращается (число, месяц, год)</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:PrecedingDecisionRegNumber/gcd:Date"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
					  7. Наименование товара, указанное в решении о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<span class="graphValue">
									<xsl:if test="gcd:GoodsDescription">
										<xsl:for-each select="gcd:GoodsDescription">
											<xsl:value-of select="."/>
										</xsl:for-each>
										<br/>
									</xsl:if>
									<xsl:for-each select="gcd:GoodsInformation">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							8. Основание(я) принятия решения о прекращении действия решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<span class="graphValue">
									<xsl:apply-templates select="gcd:InterpretationRules"/>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							9. Причины(а) принятия решения о прекращении действия решения о классификации товара, перемещаемого в виде компонентов:</span>
								<br/>
								<span class="graphValue">
									<xsl:for-each select="gcd:ReasonsForDecision">
										<xsl:value-of select="gcd:Number"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="gcd:Text"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							10. Срок вступления в силу решения о прекращении действия решения о классификации товара, перемещаемого в виде компонентов</span>
								<br/>
								<table width="100%" style="border:0px">
									<tbody>
										<tr>
											<td align="center" class="graphValue" style="border:0px">
												<xsl:call-template name="date">
													<xsl:with-param name="text" select="gcd:DateEntryIntoForce"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							11. Служебные отметки</span>
								<br/>
								<span class="graphValue">
									<xsl:apply-templates select="gcd:Mark"/>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="graphName">
							12. Должностное лицо таможенного органа, принявшее решение о прекращении действия решения о классификации товара, перемещаемого в виде компонентов
							</span>
								<xsl:apply-templates select="gcd:CustomsPerson"/>
							</td>
						</tr>
					</tbody>
				</table>
			</xsl:if>
		</div>
		<xsl:if test="gcd:RegistryNumber/gcd:IDDoc='КР'">
			<div class="pagePortrait">
				<table width="100%" style="border:0px">
					<tbody>
						<tr>
							<td colspan="6" style="text-align:center;font-size:11pt;border:0px;border-bottom:1px solid black;">
								<b>
									<xsl:text>Перечень компонентов товара, перемещаемого через таможенную границу ЕАЭС, 
в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
ввоз или вывоз которого предполагается различными товарными партиями 
в течение установленного периода времени</xsl:text>
								</b>
								<br/>
							</td>
						</tr>
						<tr>
							<td class="graphName" style="text-align:center">№ компонента товара</td>
							<td class="graphName" style="text-align:center">Наименование компонента товара</td>
							<td class="graphName" style="text-align:center">Код в соответствии с 
						<br>единой Товарной</br>
						номенклатурой 
						внешнеэкономической 
						деятельности ЕАЭС</td>
							<td class="graphName" style="text-align:center">Количество</td>
							<td class="graphName" style="text-align:center">Единица измерения</td>
							<td class="graphName" style="text-align:center">Вес нетто (килограмм)</td>
						</tr>
						<tr>
							<td class="graphName" style="text-align:center">1</td>
							<td class="graphName" style="text-align:center">2</td>
							<td class="graphName" style="text-align:center">3</td>
							<td class="graphName" style="text-align:center">4</td>
							<td class="graphName" style="text-align:center">5</td>
							<td class="graphName" style="text-align:center">6</td>
						</tr>
						<xsl:for-each select="gcd:ComponentList">
							<xsl:sort select="RUDECLcat:IDNumber" order="ascending"/>
							<xsl:apply-templates select="." mode="application"/>
						</xsl:for-each>
					</tbody>
				</table>
			</div>
		</xsl:if>
		<xsl:if test="gcd:RegistryNumber/gcd:IDDoc='ИЗ'">
			<xsl:if test="gcd:ComponentList/RUDECLcat:ChangeAction='1'">
				<div class="pagePortrait">
					<table width="100%" style="border:0px">
						<tbody>
							<tr>
								<td colspan="6" style="text-align:right;font-size:11pt;border:0px">
									<xsl:text>Приложение № 1</xsl:text>
									<!--xsl:for-each select="gcd:Application">
										<xsl:if test="gcd:ChangeAction='1'">
											<xsl:apply-templates select="gcd:Number"/>
										</xsl:if>
									</xsl:for-each-->
								</td>
							</tr>
							<tr>
								<td colspan="6" style="text-align:center;font-size:11pt;border:0px;border-bottom:1px solid black;">
									<b>
										<xsl:text>Перечень компонентов товара, перемещаемого через таможенную границу ЕАЭС, 
в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
ввоз или вывоз которого предполагается различными товарными партиями 
в течение установленного периода времени</xsl:text>
									</b>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align:center" class="graphName">№ компонента товара</td>
								<td style="text-align:center" class="graphName">Наименование компонента товара</td>
								<td style="text-align:center" class="graphName">Код в соответствии с 
						<br>единой Товарной</br>
						номенклатурой 
						внешнеэкономической 
						деятельности ЕАЭС</td>
								<td style="text-align:center" class="graphName">Количество</td>
								<td style="text-align:center" class="graphName">Единица измерения</td>
								<td style="text-align:center" class="graphName">Вес нетто (килограмм)</td>
							</tr>
							<tr style="text-align:center">
								<td style="text-align:center" class="graphName">1</td>
								<td style="text-align:center" class="graphName">2</td>
								<td style="text-align:center" class="graphName">3</td>
								<td style="text-align:center" class="graphName">4</td>
								<td style="text-align:center" class="graphName">5</td>
								<td style="text-align:center" class="graphName">6</td>
							</tr>
							<xsl:for-each select="gcd:ComponentList">
								<xsl:sort select="RUDECLcat:IDNumber" order="ascending"/>
								<xsl:if test="RUDECLcat:ChangeAction='1'">
									<xsl:apply-templates select="." mode="application"/>
								</xsl:if>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</xsl:if>
			<xsl:if test="gcd:ComponentList/RUDECLcat:ChangeAction='2'">
				<div class="pagePortrait">
					<table width="100%" style="border:0px">
						<tbody>
							<tr>
								<td colspan="6" style="text-align:right;font-size:11pt;border:0px">
									<xsl:text>Приложение № 2</xsl:text>
									<!--xsl:for-each select="gcd:Application">
										<xsl:if test="gcd:ChangeAction='2'">
											<xsl:apply-templates select="gcd:Number"/>
										</xsl:if>
									</xsl:for-each-->
								</td>
							</tr>
							<tr>
								<td colspan="6" style="text-align:center;font-size:11pt;border:0px;border-bottom:1px solid black;">
									<b>
										<xsl:text>Перечень компонентов товара, перемещаемого через таможенную границу ЕАЭС, 
в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
ввоз или вывоз которого предполагается различными товарными партиями 
в течение установленного периода времени</xsl:text>
									</b>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align:center" class="graphName">№ компонента товара</td>
								<td style="text-align:center" class="graphName">Наименование компонента товара</td>
								<td style="text-align:center" class="graphName">Код в соответствии с 
						<br>единой Товарной</br>
						номенклатурой 
						внешнеэкономической 
						деятельности ЕАЭС</td>
								<td style="text-align:center" class="graphName">Количество</td>
								<td style="text-align:center" class="graphName">Единица измерения</td>
								<td style="text-align:center" class="graphName">Вес нетто (килограмм)</td>
							</tr>
							<tr style="text-align:center">
								<td style="text-align:center" class="graphName">1</td>
								<td style="text-align:center" class="graphName">2</td>
								<td style="text-align:center" class="graphName">3</td>
								<td style="text-align:center" class="graphName">4</td>
								<td style="text-align:center" class="graphName">5</td>
								<td style="text-align:center" class="graphName">6</td>
							</tr>
							<xsl:for-each select="gcd:ComponentList">
								<xsl:sort select="RUDECLcat:IDNumber" order="ascending"/>
								<xsl:if test="RUDECLcat:ChangeAction='2'">
									<xsl:apply-templates select="." mode="application"/>
								</xsl:if>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</xsl:if>
			<xsl:if test="gcd:ComponentList/RUDECLcat:ChangeAction='3'">
				<div class="pagePortrait">
					<table width="100%" style="border:0px">
						<tbody>
							<tr>
								<td colspan="6" style="text-align:right;font-size:11pt;border:0px">
									<xsl:text>Приложение № 3</xsl:text>
									<!-- xsl:for-each select="gcd:Application">
										<xsl:if test="gcd:ChangeAction='3'">
											<xsl:apply-templates select="gcd:Number"/>
										</xsl:if>
									</xsl:for-each -->
								</td>
							</tr>
							<tr>
								<td colspan="6" style="text-align:center;font-size:11pt;border:0px;border-bottom:1px solid black;">
									<b>
										<xsl:text>Перечень компонентов товара, перемещаемого через таможенную границу ЕАЭС, 
в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, 
ввоз или вывоз которого предполагается различными товарными партиями 
в течение установленного периода времени</xsl:text>
									</b>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="text-align:center" class="graphName">№ компонента товара</td>
								<td style="text-align:center" class="graphName">Наименование компонента товара</td>
								<td style="text-align:center" class="graphName">Код в соответствии с 
						<br>единой Товарной</br>
						номенклатурой 
						внешнеэкономической 
						деятельности ЕАЭС</td>
								<td style="text-align:center" class="graphName">Количество</td>
								<td style="text-align:center" class="graphName">Единица измерения</td>
								<td style="text-align:center" class="graphName">Вес нетто (килограмм)</td>
							</tr>
							<tr style="text-align:center">
								<td style="text-align:center" class="graphName">1</td>
								<td style="text-align:center" class="graphName">2</td>
								<td style="text-align:center" class="graphName">3</td>
								<td style="text-align:center" class="graphName">4</td>
								<td style="text-align:center" class="graphName">5</td>
								<td style="text-align:center" class="graphName">6</td>
							</tr>
							<xsl:for-each select="gcd:ComponentList">
								<xsl:sort select="RUDECLcat:IDNumber" order="ascending"/>
								<xsl:if test="RUDECLcat:ChangeAction='3'">
									<xsl:apply-templates select="." mode="application"/>
								</xsl:if>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</xsl:if>
		</xsl:if>
		<xsl:if test="gcd:Comment">
			<div class="pagePortrait">
				<table width="100%" style="font-size:10pt;border:0px;">
					<tbody>
						<tr>
							<td width="100%" style="font-size:10pt;border:0px;">
								<span class="graphName">Примечания:</span>
							</td>
						</tr>
						<xsl:for-each select="gcd:Comment">
							<tr>
								<td style="font-size:10pt;border:0px;border-bottom:1px solid black; text-valign: bottom">
									<xsl:value-of select="."/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
