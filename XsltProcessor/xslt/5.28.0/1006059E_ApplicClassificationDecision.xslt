<?xml version="1.0" encoding="utf-8"?>
<!-- Заявление о принятии Решения по классификации Статья 107 311-ФЗ от 27.11.2010  (в ред. 365-ФЗ) п.3 -9   (Форма не регламентирована)  -->
<!-- Заявление о принятии Решения о внесении изменений в решение по классификации Статья 107.1  311-ФЗ от 27.11.2010  (в ред. 365-ФЗ) п.6 -7 (Форма не регламентирована) -->
<!-- Приказ ФТС России от 06.02.2019 № 194 
IDDoc = 'КР' - Приложение 1 - Заявление о принятии решения о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени
IDDoc = 'ИЗ' Приложение 12 - Заявление о внесении изменений в решение о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:acd="urn:customs.ru:Information:CustomsDocuments:ApplicClassificationDecision:5.28.0">
	<!-- Шаблон для типа ApplicClassificationDecisionType -->
	<xsl:template match="acd:ApplicClassificationDecision">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 210mm;
					max-width: 210mm;
					min-width: 210mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					div.page297 {
					width: 297mm;
					max-width: 297mm;
					min-width: 297mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm;
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
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }
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
					
					table.persSignature {
                        width: 100%;
                        border-collapse: separate;
                    }

                    table.persSignature, table.persSignature tr td {
                        border: none;
                        margin-top: 10px;
                        border-spacing: 8px 0;
                    }

                    table.persSignature tr td.graphUnderline {
                        padding: 0 6px;
                    }

                    table.persSignature tr td.graphUnderline {
                        border: none;
                        border-bottom: 1px dotted black;
                        text-align: center;
                        vertical-align: bottom;
                    }

                    td.graph, table.persSignature tr td.graph {
                        border: none;
                        font-size: 90%;
                        text-align: center;
                        padding: 0;
                        spacing: 0;
                        white-space: normal;
                    }
                    
                    table.application {
                        border: 1px solid #000000;
                        vertical-align: top;
                        border-collapse: collapse;
                    }

                    table.application td {
                        vertical-align: top;
                        border: 1px solid #000000;
                    }
                    
                    .inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
					.underlined{
						border-bottom: 1px solid windowtext;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:if test="acd:IDDoc='КР'">
						<table>
							<tbody>
								<tr>
									<td align="center">Начальнику (заместителю начальника) Управления товарной номенклатуры ФТС России</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>
											Заявление о принятии решения о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени
										</b>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="acd:Declarant"/>
												<xsl:if test="acd:Declarant/RUScat_ru:SubjectAddressDetails">
													<xsl:for-each select="acd:Declarant/RUScat_ru:SubjectAddressDetails">
														<xsl:text disable-output-escaping="yes">;&lt;br&gt;</xsl:text>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="acd:Declarant/RUScat_ru:CommunicationDetails">
													<xsl:text disable-output-escaping="yes">;&lt;br&gt;Контактные данные: </xsl:text>
													<xsl:apply-templates select="acd:Declarant/RUScat_ru:CommunicationDetails"/>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'сведения о заявителе'"/>
											<xsl:with-param name="width" select="'100%'"/>
											<xsl:with-param name="supIndexDescr" select="'1'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td>Прошу выдать решение о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени.</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td>
										<xsl:text>1) </xsl:text>
										<xsl:apply-templates select="acd:GoodsDescription"/>
										<xsl:if test="acd:GoodsInformation">
											<br/>
											<xsl:text>Характеристики товара: </xsl:text>
											<table>
												<tbody>
													<tr align="center" valign="top">
														<td class="bordered">Марка</td>
														<td class="bordered">Модель</td>
														<td class="bordered">Артикул</td>
														<td class="bordered">Иные</td>
													</tr>
													<xsl:for-each select="acd:GoodsInformation">
														<tr valign="top">
															<td class="bordered">
																<xsl:value-of select="acd:GoodsMark"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="acd:GoodsModel"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="acd:GoodsMarking"/>
															</td>
															<td class="bordered">
																<xsl:value-of select="acd:GoodsOtherInfo"/>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</xsl:if>
										<br/>
										<xsl:text>2) Срок поставки товара: </xsl:text>
										<xsl:if test="acd:StartDelivery">
											<xsl:text> с </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="acd:StartDelivery"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="acd:TermOfDelivery">
											<xsl:text> по </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="acd:TermOfDelivery"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:text>3) Таможенная процедура, под которую будет помещен товар: </xsl:text>
										<xsl:choose>
											<xsl:when test="acd:CustomsModeCode='10'">Экспорт</xsl:when>
											<xsl:when test="acd:CustomsModeCode='21'">Переработка вне таможенной территории</xsl:when>
											<xsl:when test="acd:CustomsModeCode='23'">Временный вывоз</xsl:when>
											<xsl:when test="acd:CustomsModeCode='31'">Реэкспорт</xsl:when>
											<xsl:when test="acd:CustomsModeCode='40'">Выпуск для внутреннего потребления</xsl:when>
											<xsl:when test="acd:CustomsModeCode='51'">Переработка на таможенной территории</xsl:when>
											<xsl:when test="acd:CustomsModeCode='53'">Временный ввоз (допуск)</xsl:when>
											<xsl:when test="acd:CustomsModeCode='60'">Реимпорт</xsl:when>
											<xsl:when test="acd:CustomsModeCode='70'">Таможенный склад</xsl:when>
											<xsl:when test="acd:CustomsModeCode='77'">Свободный склад</xsl:when>
											<xsl:when test="acd:CustomsModeCode='78'">Свободная таможенная зона</xsl:when>
											<xsl:when test="acd:CustomsModeCode='80'">Таможенный транзит</xsl:when>
											<xsl:when test="acd:CustomsModeCode='90'">Специальная таможенная процедура</xsl:when>
											<xsl:when test="acd:CustomsModeCode='91'">Переработка для внутреннего потребления</xsl:when>
											<xsl:when test="acd:CustomsModeCode='93'">Уничтожение</xsl:when>
											<xsl:when test="acd:CustomsModeCode='96'">Беспошлинная торговля </xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="acd:CustomsModeCode"/>
											</xsl:otherwise>
										</xsl:choose>
										<br/>
										<xsl:text>4) Таможенный орган: </xsl:text>
										<xsl:apply-templates select="acd:CustomsDecl" mode="spaced"/>
										<br/>
										<xsl:text>5) Вид формы принятия решения: </xsl:text>
										<xsl:choose>
											<xsl:when test="acd:FormDecision=1">электронный документ</xsl:when>
											<xsl:when test="acd:FormDecision=2">на бумажном носителе</xsl:when>
										</xsl:choose>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<xsl:apply-templates select="acd:PersonSignature"/>
						<br/>
						<br/>
						<p style="font-size: 8pt;">
							<sup>1</sup> Для физического лица указывается фамилия, имя, отчество (при наличии), серия, номер паспорта, кем и когда выдан, идентификационный номер налогоплательщика, почтовый адрес, контактный телефон. Для юридического лица указывается наименование организации, идентификационный номер налогоплательщика, основной государственный регистрационный номер, почтовый адрес, контактный телефон. В случае если заявление подается представителем, также указываются такие сведения о представителе.
						</p>
					</xsl:if>
					<xsl:if test="acd:IDDoc='ИЗ'">
						<table>
							<tbody>
								<tr>
									<td align="center">Начальнику (заместителю начальника) Управления товарной номенклатуры ФТС России</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>
											Заявление о внесении изменений в решение о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени
										</b>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="acd:Declarant"/>
												<xsl:if test="acd:Declarant/RUScat_ru:SubjectAddressDetails">
													<xsl:for-each select="acd:Declarant/RUScat_ru:SubjectAddressDetails">
														<xsl:text disable-output-escaping="yes">;&lt;br&gt;</xsl:text>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="acd:Declarant/RUScat_ru:CommunicationDetails">
													<xsl:text disable-output-escaping="yes">;&lt;br&gt;Контактные данные: </xsl:text>
													<xsl:apply-templates select="acd:Declarant/RUScat_ru:CommunicationDetails"/>
												</xsl:if>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'left'"/>
											<xsl:with-param name="description" select="'сведения о заявителе'"/>
											<xsl:with-param name="width" select="'100%'"/>
											<xsl:with-param name="supIndexDescr" select="'1'"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<td>
										<xsl:text>Прошу выдать решение о внесении изменений в решение о классификации товара, перемещаемого через таможенную границу ЕАЭС в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени (далее - решение о классификации товара)</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates mode="IZ" select="acd:PrecedingDecisionRegNumber"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'регистрационный номер и дата принятия решения о классификации товара'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:text>в связи с</xsl:text>
										<xsl:call-template name="inlinetable">
											<xsl:with-param name="data">
												<xsl:apply-templates select="acd:ReasonDecision"/>
											</xsl:with-param>
											<xsl:with-param name="data_align" select="'center'"/>
											<xsl:with-param name="description" select="'основание для принятия решения о внесении изменений в решение о классификации товара'"/>
											<xsl:with-param name="width" select="'100%'"/>
										</xsl:call-template>
										<xsl:if test="acd:OtherInfo">
											<br/>
											<xsl:text>Иные сведения: </xsl:text>
											<xsl:apply-templates select="acd:OtherInfo"/>
										</xsl:if>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<br/>
						<xsl:apply-templates select="acd:PersonSignature"/>
						<br/>
						<br/>
						<p style="font-size: 8pt;">
							<sup>1</sup> Для физического лица указывается фамилия, имя, отчество (при наличии), серия, номер паспорта, кем и когда выдан, идентификационный номер налогоплательщика, почтовый адрес, контактный телефон. Для юридического лица указывается наименование организации, идентификационный номер налогоплательщика, основной государственный регистрационный номер, почтовый адрес, контактный телефон. В случае если заявление подается представителем, также указываются такие сведения о представителе.
						</p>
					</xsl:if>
				</div>
				<xsl:if test="acd:IDDoc='КР' or (acd:IDDoc='ИЗ' and (acd:ComponentList/RUDECLcat:ChangeAction='1' or acd:ComponentList/RUDECLcat:ChangeAction='2' or acd:ComponentList/RUDECLcat:ChangeAction='3'))">
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>
											Перечень компонентов товара, перемещаемого через таможенную границу ЕАЭС, в несобранном или разобранном виде, в том числе в некомплектном или незавершенном виде, ввоз или вывоз которого предполагается различными товарными партиями в течение установленного периода времени
										</b>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr align="center" valign="top">
									<td class="bordered">
										<b>№ 
компонента 
товара</b>
									</td>
									<td class="bordered">
										<b>Наименование компонента товара</b>
									</td>
									<td class="bordered">
										<b>Код в соответствии с 
						<br>единой Товарной</br>
						номенклатурой 
						внешнеэкономической 
						деятельности ЕАЭС</b>
									</td>
									<td class="bordered">
										<b>Количество</b>
									</td>
									<td class="bordered">
										<b>Единица измерения</b>
									</td>
									<td class="bordered">
										<b>Вес нетто (килограмм)</b>
									</td>
								</tr>
								<tr align="center" valign="top">
									<td class="bordered">
										<b>1</b>
									</td>
									<td class="bordered">
										<b>2</b>
									</td>
									<td class="bordered">
										<b>3						</b>
									</td>
									<td class="bordered">
										<b>4</b>
									</td>
									<td class="bordered">
										<b>5</b>
									</td>
									<td class="bordered">
										<b>6</b>
									</td>
								</tr>
								<xsl:for-each select="acd:ComponentList">
									<xsl:sort select="RUDECLcat:IDNumber" order="ascending"/>
									<tr valign="top">
										<td align="center" class="bordered">
											<xsl:value-of select="RUDECLcat:IDNumber"/>
											<!--<xsl:value-of select="RUDECLcat:ComponentId"/>
											<xsl:if test="RUDECLcat:ComponentId and (RUDECLcat:IDNumber or RUDECLcat:ParentIDNumber)">
												<xsl:text> (</xsl:text>
											</xsl:if>
											<xsl:value-of select="RUDECLcat:ParentIDNumber"/>
											<xsl:if test="RUDECLcat:IDNumber and RUDECLcat:ParentIDNumber">
												<xsl:text>:</xsl:text>
											</xsl:if>
											<xsl:value-of select="RUDECLcat:IDNumber"/>
											<xsl:if test="RUDECLcat:ComponentId and (RUDECLcat:IDNumber or RUDECLcat:ParentIDNumber)">
												<xsl:text>)</xsl:text>
											</xsl:if>-->
										</td>
										<td class="bordered" align="left">
											<xsl:value-of select="RUDECLcat:ComponentName"/>
										</td>
										<td align="center" class="bordered">
											<xsl:value-of select="catESAD_cu:GoodsTNVEDCode"/>
										</td>
										<td align="center" class="bordered">
											<xsl:value-of select="catESAD_cu:SupplementaryQuantity/catESAD_cu:GoodsQuantity"/>
										</td>
										<td align="center" class="bordered">
											<xsl:value-of select="catESAD_cu:SupplementaryQuantity/catESAD_cu:MeasureUnitQualifierName"/>
											<!--xsl:if test="catESAD_cu:SupplementaryQuantity/catESAD_cu:MeasureUnitQualifierCode">
												<xsl:text> (</xsl:text>
												<xsl:value-of select="catESAD_cu:SupplementaryQuantity/catESAD_cu:MeasureUnitQualifierCode"/>
												<xsl:text>)</xsl:text>
											</xsl:if-->
										</td>
										<td align="center" class="bordered">
											<xsl:value-of select="catESAD_cu:KGWeight"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="acd:ReasonDecision">
		<xsl:for-each select="acd:ReasonDecisionKind">
			<xsl:if test="position() &gt; 1">; </xsl:if>
			<xsl:choose>
				<xsl:when test=".=1">Принято решение или есть разъяснение</xsl:when>
				<xsl:when test=".=2">Внесено изменение в ТН ВЭД ЕАЭС</xsl:when>
				<xsl:when test=".=3">Ошибки или опечатки</xsl:when>
				<xsl:when test=".=4">Изменение сведений о заявителе и (или) таможенном органе</xsl:when>
				<xsl:when test=".=5">Изменение условий внешнеэкономической сделки</xsl:when>
				<xsl:when test=".=6">Представление декларантом заявления об отказе от дальнейших поставок компонентов товара</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="acd:ReasonDecisionText"/>
	</xsl:template>
	<xsl:template mode="IZ" match="acd:PrecedingDecisionRegNumber">
		<xsl:value-of select="acd:IDDoc"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="acd:CountryCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="acd:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring(acd:Date, 3, 2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="acd:SerialNumber"/>
	</xsl:template>
	<xsl:template match="acd:PrecedingDecisionRegNumber">
		<xsl:text> № </xsl:text>
		<xsl:value-of select="acd:SerialNumber"/>
		<xsl:text> от </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="acd:Date"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="acd:PersonSignature">
		<table>
			<tbody>
				<tr align="center" valign="bottom">
					<td width="30%" class="value">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td width="5%"/>
					<td width="30%" class="value"/>
					<td width="5%"/>
					<td width="30%" class="value">
						<xsl:value-of select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
				<tr>
					<td width="30%" class="descr">(должность)</td>
					<td width="5%"/>
					<td width="30%" class="descr">(подпись заявителя)</td>
					<td width="5%"/>
					<td width="30%" class="descr">(Ф.И.О.)</td>
				</tr>
				<tr>
					<td colspan="5">
						<br/>
						<br/>
						<xsl:text>Дата: </xsl:text>
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="quantity">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="acd:Declarant">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="acd:DeclarantSign=1 or acd:DeclarantSign='true'">
			<xsl:text>; </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="comma"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
			<xsl:text>; ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
			<xsl:text>; ИНН </xsl:text>
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
			<xsl:text>; КПП </xsl:text>
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="spaced">
		<xsl:for-each select="./*">
			<xsl:if test="position() &gt; 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="comma">
		<xsl:for-each select="./*">
			<xsl:if test="position() &gt; 1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<xsl:param name="supIndexData"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data" disable-output-escaping="yes"/>
						<sup>
							<xsl:value-of select="$supIndexData"/>
						</sup>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description" disable-output-escaping="yes"/>
						<sup>
							<xsl:value-of select="$supIndexDescr"/>
						</sup>
					</td>
				</tr>
			</tbody>
		</table>
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
