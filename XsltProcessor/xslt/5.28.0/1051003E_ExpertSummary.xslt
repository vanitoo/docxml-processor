<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exs="urn:customs.ru:Information:CustomsDocuments:ExpertSummary:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:sig="http://www.w3.org/2000/09/xmldsig#">
	<!--xsl:param name="signatures"/-->
	<xsl:param name="signatures"/>
	  <!-- формат данных в signatures
		<root>
		  <cert id="4D2B4C8000010003BFAC" owner="Семенов Виталий Александрович" from="2022-12-06T15:59:18" to="2023-12-05T16:09:18" />
		  <cert ... />
		</root>
		-->
	<xsl:include href="ElSign.xslt"/>
	<xsl:variable name="capitalLetters" select="'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'"/>
	<xsl:variable name="smallLetters" select="'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'"/>
	
	<!-- Шаблон для типа ExpertSummaryType -->
	<xsl:template match="//*[local-name()='ExpertSummary']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
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
	
	<xsl:template match="exs:ExpertSummary">
		<xsl:variable name="me_us">
			<xsl:choose>
				<xsl:when test="count(exs:CustomsPerson) &gt; 1">Мы</xsl:when>
				<xsl:otherwise>Я</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="me_us2">
			<xsl:choose>
				<xsl:when test="count(exs:CustomsPerson) &gt; 1">Нам</xsl:when>
				<xsl:otherwise>Мне</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="hasCounter">
			<xsl:value-of select="count(exs:CustomsPerson)"/>
		</xsl:variable>
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
					body {
					background: #cccccc;
					font-family: Arial;
					font-size: 10pt;
					}

					div.page {
					width: 180mm;
					padding: 10mm;
					/*padding-left:	10mm;*/
					background: #ffffff;
					border: solid 1pt #000000;
					font-family: Arial;
					font-size: 10pt;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					table-layout: fixed;
					font-family: Arial;
					font-size: 10pt;
					}
					
					td {
					max-width: 180mm;
					word-break: break-word;
					word-wrap: break-word;
					-ms-word-break: break-all;
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

					.underlined {
					border-bottom: 1px solid windowtext;
					vertical-align:bottom;
					}

					.graphMain
					{
					font-family: Arial;
					font-size: 10pt;
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
					div.page {
						border: solid 1pt #ffffff;
					}
				</style>
			</head>
			<body>
				<!-- ========================================================================= -->
				<xsl:if test="exs:CustomsControl">
					<!-- Экспертиза в рамках ТК (Форма по Приказу ФТС России от 17.01.2019 № 46)-->
					<!--ТК-->
					<div class="page graphMain">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
										<br/>
										<b>Центральное экспертно-криминалистическое таможенное управление</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b>
											<xsl:apply-templates select="exs:EKSName"/>
										</b>
										<xsl:if test="exs:CEKTUDivision/exs:BranchNotEKSSign = '1' or exs:CEKTUDivision/exs:BranchNotEKSSign = 't' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'true' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'T'">
											<br/>
											<b>
												<xsl:apply-templates select="exs:CEKTUDivision/exs:Name"/>
											</b>
										</xsl:if>
										<br/>
										<xsl:apply-templates select="exs:CEKTUDivision/exs:Address"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<b>
											<xsl:text>ЗАКЛЮЧЕНИЕ ТАМОЖЕННОГО ЭКСПЕРТА</xsl:text>
											<!--xsl:choose>
												<xsl:when test="count(exs:CustomsPerson) > 1">ТАМОЖЕННЫХ ЭКСПЕРТОВ</xsl:when>
												<xsl:otherwise>ТАМОЖЕННОГО ЭКСПЕРТА</xsl:otherwise>
											</xsl:choose-->
										</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td width="35%" valign="top" align="left">
														<xsl:text>№ </xsl:text>
														<u> <xsl:apply-templates select="exs:ExpertSummaryNumber"/> </u>
													</td>
													<td width="35%" valign="top" align="center">
														<xsl:text>от </xsl:text>
														<xsl:apply-templates select="exs:ExpertSummaryDate" mode="DateStr"/>
														<!--<xsl:call-template name="DateStr">
															<xsl:with-param name="date" select="exs:ExpertSummaryDate"/>
														</xsl:call-template>-->
													</td>
													<td width="30%" align="right" valign="top">
														<u> <xsl:apply-templates select="exs:ExpertSummaryCity"/> </u>
													</td>
												</tr>
											</tbody>
										</table>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<b>1. </b>Таможенным экспертом: 
										<!--xsl:value-of select="$me_us"/>
										<xsl:text>, </xsl:text-->
										<xsl:for-each select="exs:CustomsPerson">
											<u>
												<xsl:value-of select="concat(cat_ru:PersonSurname,' ',cat_ru:PersonName,' ',cat_ru:PersonMiddleName)"/>
											</u>,
											<xsl:apply-templates select="exs:Qualification"/>
											<xsl:if test="position()!=last()">
												<xsl:text>; </xsl:text>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>на основании </xsl:text>
										<u>
											<xsl:text>решения </xsl:text>
											<xsl:text> о назначении таможенной экспертизы  от </xsl:text>
											<xsl:apply-templates select="exs:CustomsControl/exs:DecisionDate" mode="monthword_date"/>
											<!--<xsl:call-template name="monthword_date">
												<xsl:with-param name="dateIn" select="exs:CustomsControl/exs:DecisionDate"/>
											</xsl:call-template>-->
											<xsl:text> г. № </xsl:text>
											<xsl:for-each select="exs:CustomsControl/exs:DecisionNumber">
												<xsl:apply-templates select="cat_ru:CustomsCode"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gdt_date"/>
												<!--<xsl:call-template name="gdt_date">
													<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
												</xsl:call-template>-->
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="exs:ExpertisePoint"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="cat_ru:SerialNumber"/>
											</xsl:for-each>
											<!--
										по документам: <xsl:if test="exs:PresentedDocuments/exs:GTDNumber">ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:if test="exs:PresentedDocuments/exs:GTDNumber">,</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:for-each select="//exs:DocumentName">
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'">
															<xsl:text> от </xsl:text>
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="."/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="."/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()">
														<xsl:text> </xsl:text>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<xsl:text>, </xsl:text>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
										-->
											<xsl:text>, вынесенного </xsl:text>
											<xsl:if test="exs:CustomsControl">
												<xsl:if test="exs:CustomsControl/exs:Customs/cat_ru:OfficeName">
													<xsl:apply-templates select="exs:CustomsControl/exs:Customs/cat_ru:OfficeName"/>
													<xsl:text> (</xsl:text>
												</xsl:if>
												<xsl:apply-templates select="exs:CustomsControl/exs:Customs/cat_ru:Code"/>
												<xsl:if test="exs:CustomsControl/exs:Customs/cat_ru:OfficeName">
													<xsl:text>), </xsl:text>
												</xsl:if>
											</xsl:if>
											<xsl:value-of select="concat(exs:CustomsControl/exs:InitiatorPerson/cat_ru:PersonSurname,' ',exs:CustomsControl/exs:InitiatorPerson/cat_ru:PersonName,' ',exs:CustomsControl/exs:InitiatorPerson/cat_ru:PersonMiddleName)"/>
											<xsl:if test="exs:CustomsControl/exs:InitiatorPerson/cat_ru:PersonPost"> (</xsl:if>
											<xsl:apply-templates select="exs:CustomsControl/exs:InitiatorPerson/cat_ru:PersonPost"/>
											<xsl:if test="exs:CustomsControl/exs:InitiatorPerson/cat_ru:PersonPost">)</xsl:if>
										</u>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text>проведена </xsl:text>
										<xsl:apply-templates select="exs:CustomsControl/exs:CustomExpertiseKind"/>
										<xsl:text>. </xsl:text>
										<u>
											<xsl:text> Место проведения: </xsl:text>
											<xsl:apply-templates select="exs:CustomsControl/exs:PlaceExp"/>
										</u>
										<br/>
										<xsl:text> с </xsl:text>
										<xsl:apply-templates select="exs:StudyStartDateTime" mode="DateStr"/>
										<!--<xsl:call-template name="DateStr">
											<xsl:with-param name="date" select="exs:StudyStartDateTime"/>
										</xsl:call-template>-->
										<xsl:text> по </xsl:text>
										<xsl:apply-templates select="exs:StudyStopDateTime" mode="DateStr"/>
										<!--<xsl:call-template name="DateStr">
											<xsl:with-param name="date" select="exs:StudyStopDateTime"/>
										</xsl:call-template>-->
										<br/>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">    
										<xsl:text>Об ответственности за дачу заведомо ложного заключения таможенного эксперта по статье 19.26 Кодекса Российской Федерации об административных правонарушениях предупрежден.</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td width="20%"/>
									<td width="2%"/>
									<td width="50%"/>
									<td width="2%"/>
									<td width="26%"/>
								</tr>
								<xsl:for-each select="exs:CustomsPerson">
									<tr>
										<td class="underlined"> <br/>
											<br/>
										</td>
										<td/>
										<td class="underlined" align="center">
											<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>
										</td>
										<td/>
										<td class="underlined" align="center">
											<xsl:apply-templates select="exs:DateSignWarning" mode="russian_date"/>
											<!--<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="exs:DateSignWarning"/>
											</xsl:call-template>-->
										</td>
										<td/>
									</tr>
									<tr>
										<td align="center" style="font-size:10">(подпись)</td>
										<td/>
										<td align="center" style="font-size:10"/>
										<td/>
										<td/>
									</tr>
									<tr>
										<td colspan="5">
											<xsl:if test="$signatures">
												<xsl:variable name="FIO">
													<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
														<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</xsl:variable>
												<xsl:apply-templates select="$signatures/cert[contains(@owner, $FIO)]" mode="Signature"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td>
										<br/>
										<b>2. Для проведения таможенной экспертизы предоставлены:</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:PresentedObject">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Документы:</xsl:text>
										<br/>
										<xsl:if test="exs:PresentedDocuments/exs:GTDNumber">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>- ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/>
											<br/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:for-each select="//exs:DocumentName">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text>
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'"> от 
														<xsl:apply-templates select="." mode="russian_date"/>
															<!--<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="."/>
															</xsl:call-template>-->
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="."/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()">
														<xsl:text/>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">    
										<xsl:text>В решении о назначении таможенной экспертизы видоизменение, частичное или полное уничтожение, разрушение материалов, документов, проб и образцов исследования </xsl:text>
										<xsl:if test="exs:CustomsControl/exs:DestructionResolution='true' or exs:CustomsControl/exs:DestructionResolution='1'">разрешено</xsl:if>
										<xsl:if test="exs:CustomsControl/exs:DestructionResolution='false' or exs:CustomsControl/exs:DestructionResolution='0'">запрещено</xsl:if>
										<xsl:text>.</xsl:text>
										<!--xsl:if test="exs:CustomsControl/exs:ProlongationDaysCount">
										<br/>&#160;&#160;&#160;&#160;
										Срок производства таможенной  экспертизы продлевался на <xsl:apply-templates select="exs:CustomsControl/exs:ProlongationDaysCount"/> раб. дн. в соответствии с ч. 3 ст, 172 Федерального закона от 27 ноября 2010 г. № 311-ФЗ «О таможенном регулировании в Российской Федерации».
										</xsl:if-->
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<b>3. Перед таможенным экспертом поставлены вопросы:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Question">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table width="100%">
							<tbody>
								<tr>
									<td width="100%">
										<br/>
										<b>4. Содержание и результаты исследования:</b>
									</td>
								</tr>
							</tbody>
						</table>
						<table width="100%">
							<tbody>
								<xsl:for-each select="exs:CustomsPerson">
									<tr>
										<td width="35%"/>
										<td width="2%"/>
										<td width="16%"/>
										<td width="2%"/>
										<td width="45%"/>
									</tr>
									<xsl:if test="(//exs:CustomsControl/exs:MethodExp != 2) or ((//exs:CustomsControl/exs:MethodExp = 2) and exs:Inspection and position()=1)">
										<xsl:if test="($hasCounter &gt; 1) and (//exs:CustomsControl/exs:MethodExp != 2)">
											<tr>
												<td colspan="5">4.<xsl:value-of select="position()"/>
													<xsl:text>. </xsl:text>
													<br/>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="exs:ListAppliedMethods">
											<tr>
												<td colspan="5">
													<b>
														<xsl:text>Перечень применённых методов</xsl:text>
													</b>
													<br/>
												</td>
											</tr>
											<tr>
												<td colspan="5">
													<xsl:variable name="ListAppliedMethods_CustC">
														<xsl:apply-templates select="exs:ListAppliedMethods"/>
														<!-- в функцию надо сразу содержимое всех элементов -->
													</xsl:variable>
													<xsl:call-template name="replace_p">
														<xsl:with-param name="input" select="$ListAppliedMethods_CustC"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td colspan="5">
													<br/>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="exs:DevicesEquipmentUsed">
											<tr>
												<td colspan="5">
													<b>
														<xsl:text>Данные об использованных приборах и оборудовании</xsl:text>
													</b>
													<br/>
												</td>
											</tr>
											<tr>
												<td colspan="5">
													<xsl:variable name="DevicesEquipmentUsed_CustC">
														<xsl:apply-templates select="exs:DevicesEquipmentUsed"/>
														<!-- в функцию надо сразу содержимое всех элементов -->
													</xsl:variable>
													<xsl:call-template name="replace_p">
														<xsl:with-param name="input" select="$DevicesEquipmentUsed_CustC"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td colspan="5">
													<br/>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="exs:ListReferences">
											<tr>
												<td colspan="5">
													<b>
														<xsl:text>Перечень использованных справочных материалов (литературы)</xsl:text>
													</b>
													<br/>
												</td>
											</tr>
											<tr>
												<td colspan="5">
													<xsl:variable name="ListReferences_CustC">
														<xsl:apply-templates select="exs:ListReferences"/>
														<!-- в функцию надо сразу содержимое всех элементов -->
													</xsl:variable>
													<xsl:call-template name="replace_p">
														<xsl:with-param name="input" select="$ListReferences_CustC"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td colspan="5">
													<br/>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="exs:Inspection or position()=1">
											<tr>
												<td colspan="5">
													<b>
														<xsl:text>Внешний осмотр</xsl:text>
													</b>
													<br/>
												</td>
											</tr>
											<tr>
												<td colspan="5">
													<xsl:variable name="Inspection_CustC">
														<xsl:apply-templates select="exs:Inspection"/>
														<!-- в функцию надо сразу содержимое всех элементов -->
													</xsl:variable>
													<xsl:call-template name="replace_p">
														<xsl:with-param name="input" select="$Inspection_CustC"/>
													</xsl:call-template>
												</td>
											</tr>
											<xsl:if test="position()=1 and ../exs:CustomsPerson[position()&gt;1 and count(exs:Inspection)=0]">
												<tr>
													<td colspan="5">
														<br/>
													</td>
												</tr>
												<tr>
													<td>Таможенный эксперт</td>
													<td/>
													<td class="underlined"/>
													<td/>
													<td align="right">
														<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>
													</td>
												</tr>
												<tr>
													<td/>
													<td/>
													<td align="center" style="font-size:10">(подпись)</td>
													<td/>
													<td/>
												</tr>
												<xsl:for-each select="../exs:CustomsPerson[position()&gt;1 and count(exs:Inspection)=0]">
													<tr>
														<td colspan="5">
															<br/>
														</td>
													</tr>
													<tr>
														<td>Таможенный эксперт</td>
														<td/>
														<td class="underlined"/>
														<td/>
														<td align="right">
															<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>
														</td>
													</tr>
													<tr>
														<td/>
														<td/>
														<td align="center" style="font-size:10">(подпись)</td>
														<td/>
														<td/>
													</tr>
												</xsl:for-each>
											</xsl:if>
											<tr>
												<td colspan="5">
													<br/>
												</td>
											</tr>
										</xsl:if>
									</xsl:if>
									<xsl:if test="(//exs:CustomsControl/exs:MethodExp != 2) or ((//exs:CustomsControl/exs:MethodExp = 2) and exs:Study and position()=1)">
										<tr>
											<td colspan="5">
												<b>
													<xsl:text>Исследование</xsl:text>
												</b>
												<br/>
											</td>
										</tr>
										<tr>
											<td colspan="5">
												<xsl:variable name="Study_CustC">
													<xsl:apply-templates select="exs:Study"/>
													<!-- в функцию надо сразу содержимое всех элементов -->
												</xsl:variable>
												<xsl:call-template name="replace_p">
													<xsl:with-param name="input" select="$Study_CustC"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td colspan="5">
											<br/>
										</td>
									</tr>
									<tr>
										<td>Таможенный эксперт</td>
										<td/>
										<td class="underlined"/>
										<td/>
										<td align="right">
											<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>
										</td>
									</tr>
									<tr>
										<td/>
										<td/>
										<td align="center" style="font-size:10">(подпись)</td>
										<td/>
										<td/>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td>
										<br/>
										<b>5. Оценка результатов исследований:</b>
									</td>
								</tr>
								<xsl:if test="exs:Synthesis">
									<tr>
										<td>
											<xsl:variable name="Synthesis_CustC">
												<xsl:apply-templates select="exs:Synthesis"/>
												<!-- в функцию надо сразу содержимое всех элементов -->
											</xsl:variable>
											<xsl:call-template name="replace_p">
												<xsl:with-param name="input" select="$Synthesis_CustC"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td>
										<br/>
										<b>6. Выводы:</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:Conclusion">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<xsl:for-each select="exs:CustomsPerson">
							<table>
								<tbody>
									<tr>
										<td width="35%">Таможенный эксперт</td>
										<td width="2%"/>
										<td width="16%" class="underlined"/>
										<td width="2%"/>
										<td align="right" width="45%">
											<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>
										</td>
									</tr>
									<tr>
										<td/>
										<td/>
										<td align="center" style="font-size:10">(подпись)</td>
										<td/>
										<td/>
									</tr>
									<tr>
										<td colspan="5">
											<xsl:if test="$signatures">
												<xsl:variable name="FIO">
													<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
														<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</xsl:variable>
												<xsl:apply-templates select="$signatures/cert[contains(@owner, $FIO)]" mode="Signature"/>
											</xsl:if>
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:for-each>
					</div>
				</xsl:if>
				<!-- ========================================================================= -->
				<xsl:if test="exs:AdministrativeOffence">
					<!-- Экспертиза в рамках АП (форма "Экспертиза в рамках АП") -->
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
										<br/>
										<b>Центральное экспертно-криминалистическое таможенное управление</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b>
											<xsl:apply-templates select="exs:EKSName"/>
										</b>
										<xsl:if test="exs:CEKTUDivision/exs:BranchNotEKSSign = '1' or exs:CEKTUDivision/exs:BranchNotEKSSign = 't' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'true' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'T'">
											<br/>
											<b>
												<xsl:apply-templates select="exs:CEKTUDivision/exs:Name"/>
											</b>
										</xsl:if>
										<br/>
										<xsl:apply-templates select="exs:CEKTUDivision/exs:Address"/>
									</td>
								</tr>
							</tbody>
						</table>
						<br/>
						<table>
							<tbody>
								<tr>
									<th>ЗАКЛЮЧЕНИЕ ЭКСПЕРТА<br/>
									</th>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td width="35%" valign="top" align="left">
														<xsl:text>№ </xsl:text>
														<u> <xsl:apply-templates select="exs:ExpertSummaryNumber"/> </u>
													</td>
													<td width="35%" valign="top" align="center">
														<xsl:text>от </xsl:text>
														<xsl:apply-templates select="exs:ExpertSummaryDate" mode="DateStr"/>
														<!--<xsl:call-template name="DateStr">
															<xsl:with-param name="date" select="exs:ExpertSummaryDate"/>
														</xsl:call-template>-->
													</td>
													<td width="30%" align="right" valign="top">
														<u> <xsl:apply-templates select="exs:ExpertSummaryCity"/> </u>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<br/>
										<br/>    
										<xsl:value-of select="$me_us2"/>
										<xsl:text>, </xsl:text>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:value-of select="concat(cat_ru:PersonSurname,' ',cat_ru:PersonName,' ',cat_ru:PersonMiddleName,', ',cat_ru:PersonPost)"/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
										<xsl:text>, поручено провести экспертизу по делу об административном правонарушении № </xsl:text>
										<xsl:apply-templates select="exs:AdministrativeOffence/exs:APNumber"/>.
										<br/>    В соответствии со ст. 14 Федерального закона от 31.05.2001 № 73-ФЗ “О государственной судебно-экспертной деятельности в Российской Федерации” руководителем <xsl:apply-templates select="exs:EKSName"/> разъяснены обязанности и права эксперта, предусмотренные ст. <xsl:apply-templates select="exs:AdministrativeOffence/exs:ArcticleNumberRigth"/> Кодекса Российской Федерации об административных правонарушениях (далее - КоАП России).
										<br/>    При поручении производства экспертизы об административной ответственности за дачу заведомо ложного заключения по ст. <xsl:apply-templates select="exs:AdministrativeOffence/exs:ArcticleNumber"/> КоАП России предупрежден<xsl:if test="count(exs:CustomsPerson)&gt;1">ы</xsl:if>.</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td width="20%"/>
									<td width="30%"/>
									<td width="40%"/>
									<td width="10%"/>
								</tr>
								<xsl:for-each select="exs:CustomsPerson">
									<tr>
										<td class="underlined"> <br/>
											<br/>
										</td>
										<td/>
										<td class="underlined" align="center">
											<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>
										</td>
										<td/>
									</tr>
									<tr>
										<td align="center" style="font-size:10">(подпись)</td>
										<td/>
										<td align="center" style="font-size:10">(инициалы, фамилия)</td>
										<td/>
									</tr>
									<tr>
										<td/>
										<td/>
										<td align="center">
											<br/>
											<xsl:apply-templates select="exs:DateSignWarning" mode="monthword_date"/>
											<!--<xsl:call-template name="monthword_date">
												<xsl:with-param name="dateIn" select="exs:DateSignWarning"/>
											</xsl:call-template>-->
										</td>
										<td/>
									</tr>
									<tr>
										<td colspan="4">
											<xsl:if test="$signatures">
												<xsl:variable name="FIO">
													<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
														<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</xsl:variable>
												<xsl:apply-templates select="$signatures/cert[contains(@owner, $FIO)]" mode="Signature"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;На основании определения о назначении экспертизы от </xsl:text>
										<xsl:apply-templates select="exs:AdministrativeOffence/exs:DecisionDate" mode="monthword_date"/>
										<!--<xsl:call-template name="monthword_date">
											<xsl:with-param name="dateIn" select="exs:AdministrativeOffence/exs:DecisionDate"/>
										</xsl:call-template>-->
										<xsl:text> г., должность назначившего: </xsl:text>
										<xsl:apply-templates select="exs:AdministrativeOffence/exs:InitiatorPerson/cat_ru:PersonPost"/>
										<xsl:if test="exs:AdministrativeOffence/exs:Customs">
											<xsl:text/>
											<xsl:apply-templates select="exs:AdministrativeOffence/exs:Customs/cat_ru:OfficeName"/>
											<xsl:text> (</xsl:text>
											<xsl:apply-templates select="exs:AdministrativeOffence/exs:Customs/cat_ru:Code"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
										<xsl:text>, Ф.И.О. назначившего: </xsl:text>
										<xsl:value-of select="concat(exs:AdministrativeOffence/exs:InitiatorPerson/cat_ru:PersonSurname,' ',exs:AdministrativeOffence/exs:InitiatorPerson/cat_ru:PersonName,' ',exs:AdministrativeOffence/exs:InitiatorPerson/cat_ru:PersonMiddleName)"/>
										<xsl:text>, </xsl:text>
										<xsl:text> по делу об административном правонарушении № </xsl:text>
										<xsl:apply-templates select="exs:AdministrativeOffence/exs:APNumber"/>
										<xsl:text>, </xsl:text>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:text> эксперт: </xsl:text>
											<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>,
											<xsl:text>, </xsl:text>
											<xsl:apply-templates select="exs:Qualification"/>
											<xsl:text>, </xsl:text>
										</xsl:for-each>
										<xsl:text> проведена </xsl:text>
										<xsl:apply-templates select="exs:AdministrativeOffence/exs:CustomExpertiseKind"/>
										<xsl:text> экспертиза.</xsl:text>
										<br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Экспертиза начата </xsl:text>
										<xsl:text/>
										<xsl:apply-templates select="exs:StudyStartDateTime" mode="time_date"/>
										<!--<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStartDateTime"/>
										</xsl:call-template>-->
										<xsl:text>, окончена </xsl:text>
										<xsl:text/>
										<xsl:apply-templates select="exs:StudyStopDateTime" mode="time_date"/>
										<!--<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStopDateTime"/>
										</xsl:call-template>-->
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>I. Описание поступивших на исследование объектов:</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:PresentedObject">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Документы:</xsl:text>
										<br/>
										<xsl:if test="exs:PresentedDocuments/exs:GTDNumber">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>- ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/>
											<br/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:for-each select="//exs:DocumentName">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text>
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'"> от <xsl:apply-templates select="." mode="russian_date"/>
															<!--<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="."/>
															</xsl:call-template>-->
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="."/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()">
														<xsl:text/>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>II. Вопросы, поставленные перед экспертом:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Question">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>III. ИССЛЕДОВАТЕЛЬСКАЯ ЧАСТЬ</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>1. Внешний осмотр</b>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:variable name="Inspection_AO">
												<xsl:apply-templates select="exs:Inspection"/>
												<!-- в функцию надо сразу содержимое всех элементов -->
											</xsl:variable>
											<xsl:call-template name="replace_p">
												<xsl:with-param name="input" select="$Inspection_AO"/>
												<xsl:with-param name="pref">
													<xsl:choose>
														<xsl:when test="$hasCounter &gt; 1">
															<xsl:value-of select="concat('1.',position(),'. ')"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="''"/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:with-param>
											</xsl:call-template>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>2. Исследование</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:variable name="Study_AO">
												<xsl:apply-templates select="exs:Study"/>
												<!-- в функцию надо сразу содержимое всех элементов -->
											</xsl:variable>
											<xsl:call-template name="replace_p">
												<xsl:with-param name="input" select="$Study_AO"/>
												<xsl:with-param name="pref">
													<xsl:choose>
														<xsl:when test="$hasCounter &gt; 1">
															<xsl:value-of select="concat('2.',position(),'. ')"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="''"/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:with-param>
											</xsl:call-template>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<xsl:if test="exs:Synthesis">
									<tr>
										<td align="center">
											<br/>
											<br/>
											<b>3. Синтезирующая часть</b>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:variable name="Synthesis_AO">
												<xsl:apply-templates select="exs:Synthesis"/>
												<!-- в функцию надо сразу содержимое всех элементов -->
											</xsl:variable>
											<xsl:call-template name="replace_p">
												<xsl:with-param name="input" select="$Synthesis_AO"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<xsl:for-each select="exs:CustomsPerson">
														<xsl:call-template name="CustomsPerson">
															<xsl:with-param name="person" select="."/>
															<xsl:with-param name="title_position" select="'Эксперт'"/>
															<xsl:with-param name="NotNeedPersonPost" select="1"/>
														</xsl:call-template>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>ВЫВОДЫ</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Conclusion">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
													<xsl:if test="$signatures">
														<xsl:variable name="FIO">
															<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
																<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
																<xsl:value-of select="."/>
															</xsl:for-each>
														</xsl:variable>
														<tr>
															<td colspan="5">
																<xsl:apply-templates select="$signatures/cert[contains(@owner, $FIO)]" mode="Signature"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<!-- ========================================================================= -->
				<xsl:if test="exs:CriminalCase">
					<!--Экспертиза в рамка УД (форма "Экспертиза в рамках УД")-->
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
										<br/>
										<b>Центральное экспертно-криминалистическое таможенное управление</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b>
											<xsl:apply-templates select="exs:EKSName"/>
										</b>
										<xsl:if test="exs:CEKTUDivision/exs:BranchNotEKSSign = '1' or exs:CEKTUDivision/exs:BranchNotEKSSign = 't' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'true' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'T'">
											<br/>
											<b>
												<xsl:apply-templates select="exs:CEKTUDivision/exs:Name"/>
											</b>
										</xsl:if>
										<br/>
										<xsl:apply-templates select="exs:CEKTUDivision/exs:Address"/>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>ЗАКЛЮЧЕНИЕ ЭКСПЕРТА</b>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<table>
											<tbody>
												<tr>
													<td width="35%" valign="top" align="left">
														<xsl:text>№ </xsl:text>
														<u> <xsl:apply-templates select="exs:ExpertSummaryNumber"/> </u>
													</td>
													<td width="35%" valign="top" align="center">
														<xsl:text>от </xsl:text>
														<xsl:apply-templates select="exs:ExpertSummaryDate" mode="DateStr"/>
														<!--<xsl:call-template name="DateStr">
															<xsl:with-param name="date" select="exs:ExpertSummaryDate"/>
														</xsl:call-template>-->
													</td>
													<td width="30%" align="right" valign="top">
														<u> <xsl:apply-templates select="exs:ExpertSummaryCity"/> </u>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<br/>    
										<xsl:value-of select="$me_us2"/>
										<xsl:text>, </xsl:text>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:value-of select="concat(cat_ru:PersonSurname,' ',cat_ru:PersonName,' ',cat_ru:PersonMiddleName,', ',cat_ru:PersonPost)"/>
											<xsl:if test="position()!=last()">, </xsl:if>
										</xsl:for-each>
										<xsl:text>, поручено провести экспертизу по уголовному делу № </xsl:text>
										<xsl:apply-templates select="exs:CriminalCase/exs:UDNumber"/>.
										<br/>    В соответствии со ст. 14 Федерального закона от 31.05.2001 № 73-ФЗ “О государственной судебно-экспертной деятельности в Российской Федерации” (далее - ФЗ ГСЭД) руководителем <xsl:apply-templates select="exs:EKSName"/> разъяснены обязанности и права эксперта, предусмотренные ст. <xsl:apply-templates select="exs:CriminalCase/exs:ArcticleNumberRigth"/> УПК России.
										<br/>    При поручении производства судебной экспертизы об уголовной ответственности за дачу заведомо ложного заключения по ст. <xsl:apply-templates select="exs:CriminalCase/exs:ArcticleNumber"/> Уголовного кодекса Российской Федерации предупрежден.</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td width="20%"/>
									<td width="30%"/>
									<td width="40%"/>
									<td width="10%"/>
								</tr>
								<xsl:for-each select="exs:CustomsPerson">
									<tr>
										<td class="underlined"> <br/>
											<br/>
										</td>
										<td/>
										<td class="underlined" align="center">
											<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>
										</td>
										<td/>
									</tr>
									<tr>
										<td align="center" style="font-size:10">(подпись)</td>
										<td/>
										<td align="center" style="font-size:10">(инициалы, фамилия)</td>
										<td/>
									</tr>
									<tr>
										<td/>
										<td/>
										<td align="center">
											<br/>
											<xsl:apply-templates select="exs:DateSignWarning" mode="monthword_date"/>
											<!--<xsl:call-template name="monthword_date">
												<xsl:with-param name="dateIn" select="exs:DateSignWarning"/>
											</xsl:call-template>-->
										</td>
										<td/>
									</tr>
									<tr>
										<td colspan="4">
											<xsl:if test="$signatures">
												<xsl:variable name="FIO">
													<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
														<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
														<xsl:value-of select="."/>
													</xsl:for-each>
												</xsl:variable>
												<xsl:apply-templates select="$signatures/cert[contains(@owner, $FIO)]" mode="Signature"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<br/>    
										<xsl:text>На основании постановления о назначении судебной экспертизы от </xsl:text>
										<xsl:apply-templates select="exs:CriminalCase/exs:DecisionDate" mode="monthword_date"/>
										<!--<xsl:call-template name="monthword_date">
											<xsl:with-param name="dateIn" select="exs:CriminalCase/exs:DecisionDate"/>
										</xsl:call-template>-->
										<xsl:text> г., </xsl:text>
										<xsl:value-of select="concat(exs:CriminalCase/exs:InitiatorPerson/cat_ru:PersonSurname,' ',exs:CriminalCase/exs:InitiatorPerson/cat_ru:PersonName,' ',exs:CriminalCase/exs:InitiatorPerson/cat_ru:PersonMiddleName)"/>
										<xsl:text/>
										<xsl:apply-templates select="exs:CriminalCase/exs:InitiatorPerson/cat_ru:PersonPost"/>
										<xsl:text> по уголовному делу № </xsl:text>
										<xsl:apply-templates select="exs:CriminalCase/exs:UDNumber"/>
										<xsl:text>, </xsl:text>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:text> экспертом </xsl:text>
											<xsl:value-of select="concat(cat_ru:PersonName,' ',cat_ru:PersonMiddleName,' ',cat_ru:PersonSurname)"/>,
											<xsl:apply-templates select="exs:Qualification"/>
											<xsl:text>, </xsl:text>
										</xsl:for-each>
										<xsl:text> проведена </xsl:text>
										<xsl:apply-templates select="exs:CriminalCase/exs:CustomExpertiseKind"/>
										<xsl:text> экспертиза.</xsl:text>
										<br/>
										<xsl:text>    Экспертиза начата </xsl:text>
										<xsl:text/>
										<xsl:apply-templates select="exs:StudyStartDateTime" mode="time_date"/>
										<!--<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStartDateTime"/>
										</xsl:call-template>-->
										<xsl:text>, окончена </xsl:text>
										<xsl:text/>
										<xsl:apply-templates select="exs:StudyStopDateTime" mode="time_date"/>
										<!--<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStopDateTime"/>
										</xsl:call-template>-->
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>I. Описание поступивших на исследование объектов:</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:PresentedObject">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>Документы:<br/>
										<xsl:if test="exs:PresentedDocuments/exs:GTDNumber">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>- ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/>
											<br/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:for-each select="//exs:PresentedDocuments/exs:DocumentName">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
												<xsl:text>- </xsl:text>
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'"> от <xsl:apply-templates select="." mode="russian_date"/>
															<!--<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="."/>
															</xsl:call-template>-->
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="."/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()">
														<xsl:text/>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>II. Вопросы, поставленные перед экспертом:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Question">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>III. ИССЛЕДОВАТЕЛЬСКАЯ ЧАСТЬ</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>1. Внешний осмотр</b>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:variable name="Inspection_CrimC">
												<xsl:apply-templates select="exs:Inspection"/>
												<!-- в функцию надо сразу содержимое всех элементов -->
											</xsl:variable>
											<xsl:call-template name="replace_p">
												<xsl:with-param name="input" select="$Inspection_CrimC"/>
												<xsl:with-param name="pref">
													<xsl:choose>
														<xsl:when test="$hasCounter &gt; 1">
															<xsl:value-of select="concat('1.',position(),'. ')"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="''"/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:with-param>
											</xsl:call-template>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>2. Исследование</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:variable name="Study_CrimC">
												<xsl:apply-templates select="exs:Study"/>
												<!-- в функцию надо сразу содержимое всех элементов -->
											</xsl:variable>
											<xsl:call-template name="replace_p">
												<xsl:with-param name="input" select="$Study_CrimC"/>
												<xsl:with-param name="pref">
													<xsl:choose>
														<xsl:when test="$hasCounter &gt; 1">
															<xsl:value-of select="concat('2.',position(),'. ')"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="''"/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:with-param>
											</xsl:call-template>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
												</xsl:for-each>
											</tbody>
										</table>
										<br/>
									</td>
								</tr>
								<xsl:if test="exs:Synthesis">
									<tr>
										<td align="center">
											<br/>
											<br/>3. Синтезирующая часть</td>
									</tr>
									<tr>
										<td>
											<xsl:variable name="Synthesis_CrimC">
												<xsl:apply-templates select="exs:Synthesis"/>
												<!-- в функцию надо сразу содержимое всех элементов -->
											</xsl:variable>
											<xsl:call-template name="replace_p">
												<xsl:with-param name="input" select="$Synthesis_CrimC"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<xsl:for-each select="exs:CustomsPerson">
														<xsl:call-template name="CustomsPerson">
															<xsl:with-param name="person" select="."/>
															<xsl:with-param name="title_position" select="'Эксперт'"/>
															<xsl:with-param name="NotNeedPersonPost" select="1"/>
														</xsl:call-template>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>IV.ВЫВОДЫ</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Conclusion">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="title_position" select="'Эксперт'"/>
														<xsl:with-param name="NotNeedPersonPost" select="1"/>
													</xsl:call-template>
													<xsl:if test="$signatures">
														<xsl:variable name="FIO">
															<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
																<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
																<xsl:value-of select="."/>
															</xsl:for-each>
														</xsl:variable>
														<tr>
															<td colspan="5">
																<xsl:apply-templates select="$signatures/cert[contains(@owner, $FIO)]" mode="Signature"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<!-- ========================================================================= -->
				<xsl:if test="exs:OperationalSearchActivities">
					<!-- Данные к заключению специалиста по исследованию в интересах таможенных органов /в интересах ФОИВ /в рамках ОРД (форма "Исследование в интересах таможенных органов", форма "Исследование в интересах иных ФОИВ", форма "Исследование в рамках ОРД".-->
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
										<br/>
										<b>Центральное экспертно-криминалистическое таможенное управление</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b>
											<xsl:apply-templates select="exs:EKSName"/>
										</b>
										<xsl:if test="exs:CEKTUDivision/exs:BranchNotEKSSign = '1' or exs:CEKTUDivision/exs:BranchNotEKSSign = 't' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'true' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'T'">
											<br/>
											<b>
												<xsl:apply-templates select="exs:CEKTUDivision/exs:Name"/>
											</b>
										</xsl:if>
										<br/>
										<xsl:apply-templates select="exs:CEKTUDivision/exs:Address"/>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>ЗАКЛЮЧЕНИЕ СПЕЦИАЛИСТА</b>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td width="35%" valign="top" align="left">
														<xsl:text>№ </xsl:text>
														<u> <xsl:apply-templates select="exs:ExpertSummaryNumber"/> </u>
													</td>
													<td width="35%" valign="top" align="center">
														<xsl:text>от </xsl:text>
														<xsl:apply-templates select="exs:ExpertSummaryDate" mode="DateStr"/>
													</td>
													<td width="30%" align="right" valign="top">
														<u> <xsl:apply-templates select="exs:ExpertSummaryCity"/> </u>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text>Специалист</xsl:text><xsl:if test="count(exs:CustomsPerson)&gt;1">ы</xsl:if><xsl:text> </xsl:text>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:if test="position()!=1">, </xsl:if>
											<xsl:if test="cat_ru:PersonName">
												<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
											<xsl:if test="cat_ru:PersonMiddleName">
												<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
												<xsl:text>.</xsl:text>
											</xsl:if>
											<xsl:if test="cat_ru:PersonName or cat_ru:PersonMiddleName">
												<xsl:text> </xsl:text>
											</xsl:if>
											<xsl:apply-templates select="cat_ru:PersonSurname"/>
											<xsl:text> (</xsl:text>
											<xsl:text>отдел: </xsl:text>
											<xsl:apply-templates select="../exs:CEKTUDivision/exs:Name"/>
											<xsl:text>, </xsl:text>
											<xsl:text>служба: </xsl:text>
											<xsl:apply-templates select="../exs:EKSName"/>
											<xsl:if test="cat_ru:PersonPost">
												<xsl:text>, должность: </xsl:text>
												<xsl:apply-templates select="cat_ru:PersonPost"/>
											</xsl:if>
											<xsl:text>) </xsl:text>
										</xsl:for-each>
										<xsl:text> на основании письма от </xsl:text> 
										<xsl:apply-templates select="exs:OperationalSearchActivities/exs:DecisionDate" mode="russian_date"/>
										<xsl:text> № </xsl:text>
										<xsl:apply-templates select="exs:OperationalSearchActivities/exs:DecisionNumber"/>
										<xsl:text> и документа № </xsl:text>
										<xsl:apply-templates select="exs:OperationalSearchActivities/exs:NumberCheck"/>, 
										<xsl:text> произвел</xsl:text><xsl:if test="count(exs:CustomsPerson)&gt;1">и</xsl:if><xsl:text> </xsl:text>
										<xsl:apply-templates select="exs:OperationalSearchActivities/exs:CustomExpertiseKind" /><!-- был вывод с модом mode="conjugateNeuter" - пока отказались -->
										<xsl:text> исследование.</xsl:text>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b>НА ИССЛЕДОВАНИЕ ПРЕДОСТАВЛЕНО:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:PresentedObject">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Документы:</xsl:text>
										<br/>
										<xsl:if test="exs:PresentedDocuments/exs:GTDNumber">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>- ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/>
											<br/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:for-each select="//exs:DocumentName">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text>
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'"> от <xsl:apply-templates select="." mode="russian_date"/>
															<!--<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="."/>
															</xsl:call-template>-->
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="."/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()">
														<xsl:text/>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>ИССЛЕДОВАНИЕМ ТРЕБУЕТСЯ УСТАНОВИТЬ:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Question">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text>Исследование начато </xsl:text>
										<xsl:apply-templates select="exs:StudyStartDateTime" mode="time_date"/>
										<!--<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStartDateTime"/>
										</xsl:call-template>-->
										<xsl:text>, окончено </xsl:text>
										<xsl:apply-templates select="exs:StudyStopDateTime" mode="time_date"/>
										<!--<xsl:call-template name="time_date">
											<xsl:with-param name="dateIn" select="exs:StudyStopDateTime"/>
										</xsl:call-template>-->
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>ИССЛЕДОВАНИЕ</b>
									</td>
								</tr>
								<tr>
									<td align="left">
										<b>Внешний осмотр</b>
									</td>
								</tr>
								<xsl:for-each select="exs:CustomsPerson">
									<tr>
										<td style="text-indent: 12%">
											<xsl:variable name="Inspection_OSA">
												<xsl:apply-templates select="exs:Inspection"/>
												<!-- в функцию надо сразу содержимое всех элементов -->
											</xsl:variable>
											<xsl:call-template name="replace_p">
												<xsl:with-param name="input" select="$Inspection_OSA"/>
											</xsl:call-template>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td align="left">
										<b>Исследование</b>
									</td>
								</tr>
								<xsl:for-each select="exs:CustomsPerson">
									<tr>
										<td style="text-indent: 12%">
											<xsl:variable name="Study_OSA">
												<xsl:apply-templates select="exs:Study"/>
												<!-- в функцию надо сразу содержимое всех элементов -->
											</xsl:variable>
											<xsl:call-template name="replace_p">
												<xsl:with-param name="input" select="$Study_OSA"/>
											</xsl:call-template>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>ПРОВЕДЕННЫМ ИССЛЕДОВАНИЕМ УСТАНОВЛЕНО:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Conclusion">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="expert" select="'spec'"/>
													</xsl:call-template>
													<xsl:if test="$signatures">
														<xsl:variable name="FIO">
															<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
																<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
																<xsl:value-of select="."/>
															</xsl:for-each>
														</xsl:variable>
														<tr>
															<td colspan="5">
																<xsl:apply-templates select="$signatures/cert[contains(@owner, $FIO)]" mode="Signature"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<!-- ========================================================================= -->
				<xsl:if test="exs:ContinuousExpertSupport">
					<!-- Данные к заключению специалиста по исследованию в рамках непрерывного экспертного обеспечения (форма "Исследование в рамках НЭО")-->
					<div class="page">
						<table>
							<tbody>
								<tr>
									<td align="center">
										<b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</b>
										<br/>
										<b>Центральное экспертно-криминалистическое таможенное управление</b>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b>
											<xsl:apply-templates select="exs:EKSName"/>
										</b>
										<xsl:if test="exs:CEKTUDivision/exs:BranchNotEKSSign = '1' or exs:CEKTUDivision/exs:BranchNotEKSSign = 't' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'true' or exs:CEKTUDivision/exs:BranchNotEKSSign = 'T'">
											<br/>
											<b>
												<xsl:apply-templates select="exs:CEKTUDivision/exs:Name"/>
											</b>
										</xsl:if>
										<br/>
										<xsl:apply-templates select="exs:CEKTUDivision/exs:Address"/>
									</td>
								</tr>
								<tr>
									<td align="center">
										<br/>
										<b>ЗАКЛЮЧЕНИЕ СПЕЦИАЛИСТА</b>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text>Дата составления: </xsl:text>
										<xsl:apply-templates select="exs:ExpertSummaryDate" mode="DateStr"/>
										<!--<xsl:call-template name="monthword_date">
											<xsl:with-param name="dateIn" select="exs:ExpertSummaryDate"/>
										</xsl:call-template>-->
										<!--xsl:text> года </xsl:text-->
										<br/>
										<xsl:text>Место составления: </xsl:text>
										<xsl:apply-templates select="exs:ExpertSummaryCity"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td style="text-align: justify;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text>Составлено специалист</xsl:text>
										<xsl:choose>
											<xsl:when test="count(exs:CustomsPerson)&gt;1">ами</xsl:when>
											<xsl:otherwise>ом</xsl:otherwise>
										</xsl:choose>
										<xsl:text>: </xsl:text>
										<xsl:for-each select="exs:CustomsPerson">
											<xsl:value-of select="concat(cat_ru:PersonSurname,' ',cat_ru:PersonName,' ',cat_ru:PersonMiddleName)"/>
											<xsl:if test="cat_ru:PersonPost">
												<xsl:text>, должность: </xsl:text>
												<xsl:apply-templates select="cat_ru:PersonPost"/>
											</xsl:if>
											<xsl:if test="position()!=last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each>
										<xsl:text>, на основании задания на экспертно-криминалистическое обеспечение, выданного </xsl:text>
										<xsl:apply-templates select="exs:ContinuousExpertSupport/exs:Initiator"/>
										<xsl:text> в рамках неотложных следственных действий.</xsl:text>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>Представлены исследуемые объекты:</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:PresentedObject">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Документы:</xsl:text>
										<br/>
										<xsl:if test="exs:PresentedDocuments/exs:GTDNumber">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>- ДТ № <xsl:apply-templates select="exs:PresentedDocuments/exs:GTDNumber"/>
											<br/>
										</xsl:if>
										<xsl:if test="exs:PresentedDocuments/exs:DocumentName">
											<xsl:for-each select="//exs:DocumentName">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;- </xsl:text>
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'"> от <xsl:apply-templates select="." mode="russian_date"/>
															<!--<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="."/>
															</xsl:call-template>-->
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="."/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()">
														<xsl:text/>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>Требуется ответить на следующие вопросы:
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Question">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b>ИССЛЕДОВАНИЕ</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
										<xsl:text>Исследование начато </xsl:text>
										<xsl:apply-templates select="exs:StudyStartDateTime" mode="time_date"/>
										<xsl:text>, окончено </xsl:text>
										<xsl:apply-templates select="exs:StudyStopDateTime" mode="time_date"/>
									</td>
								</tr>
								<tr>
									<td align="left">
										<b>Внешний осмотр</b>
									</td>
								</tr>
								<xsl:for-each select="exs:CustomsPerson">
									<tr>
										<td style="text-indent: 12%">
											<xsl:variable name="Inspection_CES">
												<xsl:apply-templates select="exs:Inspection"/>
												<!-- в функцию надо сразу содержимое всех элементов -->
											</xsl:variable>
											<xsl:call-template name="replace_p">
												<xsl:with-param name="input" select="$Inspection_CES"/>
											</xsl:call-template>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td align="left">
										<b>Исследование</b>
									</td>
								</tr>
								<xsl:for-each select="exs:CustomsPerson">
									<tr>
										<td style="text-indent: 12%">
											<xsl:variable name="Study_CES">
												<xsl:apply-templates select="exs:Study"/>
												<!-- в функцию надо сразу содержимое всех элементов -->
											</xsl:variable>
											<xsl:call-template name="replace_p">
												<xsl:with-param name="input" select="$Study_CES"/>
											</xsl:call-template>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td align="center">
										<br/>
										<br/>
										<b>ИССЛЕДОВАНИЕМ УСТАНОВЛЕНО:</b>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										<table>
											<tbody>
												<xsl:for-each select="exs:Conclusion">
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table>
											<tbody>
												<xsl:for-each select="exs:CustomsPerson">
													<xsl:call-template name="CustomsPerson">
														<xsl:with-param name="person" select="."/>
														<xsl:with-param name="expert" select="'spec'"/>
													</xsl:call-template>
													<xsl:if test="$signatures">
														<xsl:variable name="FIO">
															<xsl:for-each select="*[local-name() = 'PersonSurname' or local-name() = 'PersonName' or local-name() = 'PersonMiddleName']">
																<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
																<xsl:value-of select="."/>
															</xsl:for-each>
														</xsl:variable>
														<tr>
															<td colspan="5">
																<xsl:apply-templates select="$signatures/cert[contains(@owner, $FIO)]" mode="Signature"/>
															</td>
														</tr>
													</xsl:if>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template  match="exs:CustomExpertiseKind" mode="conjugateNeuter">
		<xsl:choose>
			<xsl:when test="contains(translate('Криминалистическая Товароведческая Искусствоведческая Технологическая Иная Идентификационная Материаловедческая Химическая Геммологическая Молекулярно-генетическая Палинологическая Биологическая Компьютерно-техническая Биологическая Палинологическая', $capitalLetters, $smallLetters), translate(., $capitalLetters, $smallLetters))">
				<xsl:value-of select="concat(substring-before(translate(., $capitalLetters, $smallLetters), 'ая'), 'ое')"/>
			</xsl:when>
			<xsl:when test="contains('ЭКЦ ОИС', .)">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:when test=". = 'Фоноскопическая экспертиза'">фоноскопическое</xsl:when>
			<xsl:when test=". = 'Экспертиза СТС НПИ'">СТС НПИ</xsl:when>
			<xsl:when test=". = 'Экспертиза НС, ПВ и СДЯВ'">НС, ПВ и СДЯВ</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа exs:CEKTUDivisionInformationType -->
	<xsl:template match="exs:CEKTUDivision">
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Код подразделения ЦЭКТУ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="exs:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование подразделения ЦЭКТУ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="exs:Name"/>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес подразделения ЦЭКТУ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="exs:Address"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа exs:ConclusionType -->
	<xsl:template match="exs:Conclusion">
		<tr>
			<td width="5%" valign="top">
				<!--xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text-->
				<xsl:apply-templates select="exs:ConclusionNumber"/>.
			</td>
			<td>
				<xsl:variable name="ConclusionText">
					<xsl:apply-templates select="exs:ConclusionText"/>
					<!-- в функцию надо сразу содержимое всех элементов -->
				</xsl:variable>
				<xsl:call-template name="replace_p">
					<xsl:with-param name="input" select="normalize-space($ConclusionText)"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа exs:CustomsPersonType -->
	<xsl:template match="exs:CustomsPerson">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cat_ru:PersonSurname"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cat_ru:PersonName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cat_ru:PersonPost"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="exs:Qualification"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа exs:DecisionNumberType -->
	<xsl:template match="exs:DecisionNumber" mode="CustomsControl">
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="cat_ru:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date"/>
					<!--<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>-->
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="cat_ru:SerialNumber"/>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Момент назначения экспертизы (ДВ - до выпуска ДТ, ПВ - после выпуска ДТ) </td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="exs:ExpertisePoint=ДВ">
							<xsl:text>до выпуска ДТ</xsl:text>
						</xsl:when>
						<xsl:when test="exs:ExpertisePoint=ПВ">
							<xsl:text>после выпуска ДТ</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="exs:ExpertisePoint"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа exs:SummaryType -->
	<xsl:template match="exs:ExternalIinspection"/>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="exs:GTDNumber">
		<xsl:variable name="CustCode" select="cat_ru:CustomsCode"/>
		<xsl:variable name="date">
			<xsl:apply-templates select="cat_ru:RegistrationDate" mode="number_date"/>
			<!--<xsl:call-template name="number_date">
				<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
			</xsl:call-template>-->
		</xsl:variable>
		<xsl:variable name="gdtNum" select="cat_ru:GTDNumber"/>
		<xsl:value-of select="concat($CustCode,'/',$date,'/',$gdtNum)"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="exs:InitiatorPerson">
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="cat_ru:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:apply-templates select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:PersonMiddleName">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Отчество</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа exs:PresentedDocumentsType -->
	<xsl:template match="exs:PresentedDocuments">
		<xsl:if test="exs:GTDNumber">
			<div class="title marg-top">Регистрационный номер ДТ.</div>
		</xsl:if>
		<xsl:apply-templates select="exs:GTDNumber"/>
		<xsl:if test="exs:DocumentName">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="exs:DocumentName">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа exs:PresentedObjectsType -->
	<xsl:template match="exs:PresentedObject">
		<tr valign="top">
			<td width="5%">
				<!--xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text-->
				<xsl:apply-templates select="exs:ObjectNumber"/>.
			</td>
			<td>
				<xsl:apply-templates select="exs:ObjectNote"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа exs:QualificationType -->
	<xsl:template match="exs:Qualification">
		образование: <xsl:apply-templates select="exs:Education"/>, 
        экспертная специальность: <xsl:apply-templates select="exs:Specialization"/>, 
		свидетельство: <xsl:apply-templates select="exs:ExpertSertificateNumber"/>, 
		стаж экспертной работы (лет): 
		<xsl:choose>
			<xsl:when test="exs:WorkExperience='0'">
				<xsl:text>менее одного года</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="exs:WorkExperience"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа exs:QuestionType -->
	<xsl:template match="exs:Question">
		<xsl:variable name="QuestionNumber" select="exs:QuestionNumber"/>
		<tr valign="top">
			<td width="5%">
				<!--xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text-->
				<xsl:apply-templates select="exs:QuestionNumber"/>
				<xsl:text>. </xsl:text>
			</td>
			<td>
				<xsl:apply-templates select="exs:QuestionText"/>
				<xsl:if test="//exs:CustomsPerson/exs:QuestionTextExpertInfo[exs:QuestionNumber=$QuestionNumber]">
					<br/>
					<xsl:text>Вопрос уточнен в следующей редакции: </xsl:text>
					<xsl:for-each select="//exs:CustomsPerson/exs:QuestionTextExpertInfo[exs:QuestionNumber = $QuestionNumber]">
						<br/>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="exs:QuestionTextExpertInfo">
		<u>
			<xsl:value-of select="concat(../cat_ru:PersonSurname,' ',substring(../cat_ru:PersonName,1,1),'.',substring(../cat_ru:PersonMiddleName,1,1))"/>
			<xsl:text>:</xsl:text>
		</u>
		<xsl:text/>
		<!--xsl:text>: Вопрос </xsl:text>
		<xsl:apply-templates select="exs:QuestionNumber"/>
		<xsl:text> </xsl:text-->
		<xsl:apply-templates select="exs:QuestionTextExpert"/>
	</xsl:template>
	<!-- Шаблон для типа exs:SummaryType -->
	<xsl:template name="additionElement">
		<xsl:param name="num"/>
		<tr>
			<td width="5%" valign="top">
				<xsl:value-of select="$num"/>.<xsl:apply-templates select="exs:OrderNumber"/>.</td>
			<td>
				<xsl:for-each select="exs:Description">
					<xsl:value-of select="normalize-space(.)"/>
					<xsl:if test="position()!=last()"> </xsl:if>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="CustomsPerson">
		<xsl:param name="person"/>
		<xsl:param name="expert"/>
		<xsl:param name="title_position"/>
		<xsl:param name="NotNeedPersonPost" select="0"/>
		<tr>
			<td colspan="5">
				<br/>
				<br/>
				<!--xsl:choose>
						<xsl:when test="$expert='spec'">Специалист</xsl:when>
						<xsl:otherwise>Таможенный эксперт</xsl:otherwise>
					</xsl:choose-->
				<!--(<xsl:apply-templates select="exs:Qualification/exs:Specialization"/>)-->
				<!--xsl:text>Должность эксперта </xsl:text-->
				<xsl:value-of select="$title_position"/>
				<xsl:if test="cat_ru:PersonPost and $NotNeedPersonPost!=1 and $NotNeedPersonPost!='true'">
					<br/>
					<xsl:apply-templates select="cat_ru:PersonPost"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td width="5%"/>
			<td align="center" width="50%" class="underlined">
				<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>
			</td>
			<td width="20%"/>
			<td width="25%" class="underlined"/>
			<td/>
		</tr>
		<tr>
			<td/>
			<td align="center" style="font-size:10">(инициалы, фамилия)</td>
			<td/>
			<td align="center" style="font-size:10">(подпись)</td>
			<td/>
		</tr>
	</xsl:template>
	<xsl:template match="*" mode="time_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="time_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="time_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:choose>
					<xsl:when test="substring($dateIn, 1, 4) = '0001'">
						<xsl:text>__ч.__мин.</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<u><xsl:value-of select="substring($dateIn,12,2)"/></u> ч. <u><xsl:value-of select="substring($dateIn,15,2)"/></u> мин.
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<!--xsl:call-template name="monthword_date"-->
				<xsl:call-template name="DateStr">
					<xsl:with-param name="dateIn" select="$dateIn"/>
				</xsl:call-template>
				<!--xsl:text> г.</xsl:text-->
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="number_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="number_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="number_date">
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
	<xsl:template match="*" mode="monthword_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="monthword_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="monthword_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:variable name="month" select="substring($dateIn,6,2)"/>
				<xsl:choose>
					<xsl:when test="substring($dateIn,6,2)='01'">января</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='02'">февраля</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='03'">марта</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='04'">апреля</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='05'">мая</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='06'">июня</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='07'">июля</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='08'">августа</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='09'">сентября</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='10'">октября</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='11'">ноября</xsl:when>
					<xsl:when test="substring($dateIn,6,2)='12'">декабря</xsl:when>
				</xsl:choose>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
	<xsl:template match="*" mode="DateStr">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="DateStr">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="string-length($dateIn) &gt; 0 and substring($dateIn,1,4)!='0001'">
				<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
				"<u>
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</u>"
				 <u> 
				<xsl:choose>
						<xsl:when test="$month=1">января</xsl:when>
						<xsl:when test="$month=2">февраля</xsl:when>
						<xsl:when test="$month=3">марта</xsl:when>
						<xsl:when test="$month=4">апреля</xsl:when>
						<xsl:when test="$month=5">мая</xsl:when>
						<xsl:when test="$month=6">июня</xsl:when>
						<xsl:when test="$month=7">июля</xsl:when>
						<xsl:when test="$month=8">августа</xsl:when>
						<xsl:when test="$month=9">сентября</xsl:when>
						<xsl:when test="$month=10">октября</xsl:when>
						<xsl:when test="$month=11">ноября</xsl:when>
						<xsl:when test="$month=12">декабря</xsl:when>
					</xsl:choose> 					
				</u> <xsl:value-of select="substring($dateIn,1,2)"/>
				<u>
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</u>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				"<u>     </u>"
				 <u>                  </u> 
				20<u>     </u> г.
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="gdt_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gdt_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="gdt_date">
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
	<xsl:template name="replace_p">
		<xsl:param name="input" select="''"/>
		<xsl:param name="pref" select="''"/>
		<xsl:if test="string-length($input) &gt; 0">
			<xsl:variable name="beg_p_left" select="'&lt;p left&gt;'"/>
			<xsl:variable name="beg_p_right" select="'&lt;p right&gt;'"/>
			<xsl:variable name="beg_p_center" select="'&lt;p center&gt;'"/>
			<xsl:variable name="beg_p_justify" select="'&lt;p justify&gt;'"/>
			<xsl:variable name="end_p" select="'&lt;/p&gt;'"/>
			<xsl:variable name="beg_str" select="'&lt;s&gt;'"/>
			<xsl:variable name="str_p" select="substring-before(substring-after($input, '&lt;p '), '&gt;')"/>
			<xsl:variable name="align">
				<xsl:choose>
					<xsl:when test="$str_p = 'right' or $str_p = 'center' or $str_p = 'justify'">
						<xsl:value-of select="$str_p"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'left'"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="from" select="concat('&lt;p ',$align,'&gt;')"/>
			<xsl:variable name="before_from" select="substring-before($input, $from)"/>
			<xsl:choose>
				<xsl:when test="contains($input, $from)">
					<!--   вывод подстроки предшествующей образцу  + вывод строки замены -->
					<xsl:if test="(string-length($before_from) &gt; 0) and (string-length($pref) &gt; 0)">
						<xsl:value-of select="$pref"/>
					</xsl:if>
					<xsl:value-of select="$before_from"/>
					<xsl:choose>
						<xsl:when test="$from = $beg_p_left or $from = $beg_p_right or $from = $beg_p_center or $from = $beg_p_justify">
							<p style="text-align:{$align};text-indent: 20mm;">
								<xsl:if test="(string-length($before_from) = 0) and (string-length($pref) &gt; 0)">
									<xsl:value-of select="$pref"/>
								</xsl:if>
								<xsl:call-template name="replace_str">
									<xsl:with-param name="input">
										<xsl:choose>
											<xsl:when test="contains(substring-after($input, $from), $end_p)">
												<xsl:value-of select="substring-before(substring-after($input, $from), $end_p)"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring-after($input, $from)"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:with-param>
									<xsl:with-param name="from" select="$beg_str"/>
								</xsl:call-template>
							</p>
						</xsl:when>
					</xsl:choose>
					<!--   вход в итерацию -->
					<xsl:call-template name="replace_p">
						<!--  в качестве входного параметра задается подстрока после образца замены  -->
						<xsl:with-param name="input" select="substring-after($input, $end_p)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="string-length($pref) &gt; 0">
						<xsl:value-of select="$pref"/>
					</xsl:if>
					<xsl:value-of select="$input"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="replace_str">
		<xsl:param name="input"/>
		<xsl:param name="from"/>
		<xsl:choose>
			<xsl:when test="contains($input, $from)">
				<!--   вывод подстроки предшествующей образцу  + вывод строки замены -->
				<xsl:value-of select="substring-before($input, $from)"/>
				<br/>
				<!--   вход в итерацию -->
				<xsl:call-template name="replace_str">
					<!--  в качестве входного параметра задается подстрока после образца замены  -->
					<xsl:with-param name="input" select="substring-after($input, $from)"/>
					<xsl:with-param name="from" select="$from"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$input"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
