<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:err="urn:customs.ru:Information:ExchangeDocuments:ErrorList:5.27.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Перечень ошибок, выявленных в процессе проведения форматно-логического контроля сведений, заявленных в электронной форме документа</title>
				<style type="text/css">
                    body {background-color: #cccccc;}

                    div.page {
                        width: 210mm;
                        margin: 6pt auto;
                        padding: 10mm;
                        background: white;
                        border: solid 1px black;
                    }

                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}

                    h1 {
                        text-align: center;
                        font-size: 16pt;
                        margin-bottom: 16pt;
                        counter-reset: document;
                    }

                    h2:before {
                        content: counter(document) ". ";
                        counter-increment: document;
                    }

                    h2 {
                        font-size: 14pt;
                        counter-reset: error;
                        text-align: center;
                    }

                    h3:before {
                        content: counter(document) "." counter(error) ". ";
                        counter-increment: error;
                    }

                    h3 {
						font-size: 13pt;
						margin-top: 10pt;
						margin-bottom: 2pt;
						}

                    span {font-weight: bold; margin-top: 0pt;}

                </style>
			</head>
			<body>
				<div class="page">
					<xsl:apply-templates select="//*[local-name()='ErrorList']">
						<xsl:with-param name="ProcessID" select="//*[local-name()='Envelope']/*[local-name()='Header']/*[local-name()='EDHeader']/*[local-name()='ProccessID']"/>
						<xsl:with-param name="MainProcessID" select="//*[local-name()='Envelope']/*[local-name()='Header']/*[local-name()='EDHeader']/*[local-name()='MainProccessID']"/>
					</xsl:apply-templates>
				</div>
			</body>
		</html>
	</xsl:template>
	<!--Основной шаблон. Обрабатываем корневой элемент-->
	<xsl:template match="err:ErrorList">
		<xsl:param name="ProcessID"/>
		<xsl:param name="MainProcessID"/>
		
		<h1>Перечень ошибок, выявленных в процессе проведения форматно-логического контроля сведений, заявленных в электронной форме документа</h1>
		<xsl:apply-templates select="err:Customs"/>
		<br/>
		<span style="font-size: 13pt;">Дата направления: </span>
		<xsl:apply-templates mode="russian_date" select="err:SendDate"/>
		<xsl:if test="err:CheckVersion">
			<br/>
			<span style="font-size: 13pt;">Версия алгоритма контроля: </span>
			<xsl:apply-templates select="err:CheckVersion"/>
		</xsl:if>
		<xsl:if test="$ProcessID">
			<br/>
			<span style="font-size: 13pt;">ProcessID: </span>
			<xsl:apply-templates select="$ProcessID"/>
		</xsl:if>
		<xsl:if test="$MainProcessID">
			<br/>
			<span style="font-size: 13pt;">MainProcessID: </span>
			<xsl:apply-templates select="$MainProcessID"/>
		</xsl:if>
		<br/>
		<br/>
		<xsl:if test="err:BadDocument">
			<span style="font-size: 13pt;">Документы с ошибками</span>
			<br/>
			<table style="width:100%">
				<xsl:for-each select="err:BadDocument">
					<xsl:apply-templates select=".">
						<xsl:with-param name="nom_d" select="position()"/>
					</xsl:apply-templates>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template match="err:Customs">
		<span style="font-size: 13pt;">Таможенный орган: </span>
		<xsl:apply-templates select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="cat_ru:OfficeName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="err:BadDocument">
		<xsl:param name="nom_d"/>
		<tr>
			<td style="width:5%; border-bottom: 1px solid black; vertical-align: middle" bgcolor="#e3e3e3" align="center">
				<span style="font-size: 13pt;">
					<xsl:value-of select="$nom_d"/>.</span>
			</td>
			<td style="width:95%; border-bottom: 1px solid black">
				<span>ID: </span>
				<xsl:apply-templates select="err:DocID"/>
				<br/>
				<xsl:if test="err:DocName">
					<span>Название: </span>
					<xsl:apply-templates select="err:DocName"/>
					<br/>
				</xsl:if>
				<xsl:if test="err:DocModeID">
					<span>Код вида документа: </span>
					<xsl:apply-templates select="err:DocModeID"/>
				</xsl:if>
				<xsl:if test="err:ProcedureID">
					<br/>
					<span>Таможенная процедура: </span>
					<xsl:apply-templates select="err:ProcedureID"/>
				</xsl:if>
				<xsl:if test="err:CRC">
					<br/>
					<span>Контрольная сумма: </span>
					<xsl:apply-templates select="err:CRC"/>
				</xsl:if>
				<xsl:if test="err:TechnicID">
					<br/>
					<span>Технические идентификаторы: </span>
					<xsl:for-each select="err:TechnicID">
						<xsl:apply-templates select="."/>
						<xsl:if test="position()!=last()">; </xsl:if>
					</xsl:for-each>
				</xsl:if>
			</td>
		</tr>
		<xsl:for-each select="err:Error">
			<tr>
				<td style="width:5%"/>
				<td style="width:95%; border-bottom: 1px solid silver">
					<br/>
					<span>
						<xsl:value-of select="$nom_d"/>.<xsl:value-of select="position()"/>. 
						Ошибка: "<xsl:apply-templates select="err:ErrorName"/>"
					</span>
				</td>
			</tr>
			<tr>
				<td style="width:5%"/>
				<td style="width:95%; word-break: break-all">
					<xsl:apply-templates select="."/>
				</td>
			</tr>
		</xsl:for-each>
		<tr>
			<td colspan="2">
				<br/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="err:Error">
		<xsl:if test="err:NumPP">
			<span>Порядковый номер в списке: </span>
			<xsl:apply-templates select="err:NumPP"/>
			<br/>
		</xsl:if>
		<span>Дата и время обнаружения: </span>
		<xsl:apply-templates mode="russian_date" select="err:DateInf"/>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates mode="russian_time" select="err:TimeInf"/>
		<br/>
		<span>Код ошибки: </span>
		<xsl:apply-templates select="err:ErrCode"/>
		<xsl:if test="err:ErrCodeShort"> / <xsl:value-of select="err:ErrCodeShort"/>
		</xsl:if>
		<br/>
		<span>Уровень: </span>
		<xsl:apply-templates select="err:ErrLevel"/>
		<xsl:if test="err:ErrField">
			<br/>
			<span>Номер графа ДТ/ДТС/КДТ: </span>
			<xsl:apply-templates select="err:ErrField"/>
		</xsl:if>
		<xsl:if test="err:GTDGoodsNumber">
			<br/>
			<span>Номер товара по ДТ/списку: </span>
			<xsl:apply-templates select="err:GTDGoodsNumber"/>
		</xsl:if>
		<xsl:if test="err:ErrElement">
			<br/>
			<span>Имя ошибочного узла/элемента/атрибута: </span>
			<xsl:apply-templates select="err:ErrElement"/>
		</xsl:if>
		<xsl:if test="err:ErrElementDesc">
			<br/>
			<span>Описание поля, в котором найдена ошибка: </span>
			<xsl:apply-templates select="err:ErrElementDesc"/>
		</xsl:if>
		<xsl:if test="err:SuccessContent">
			<br/>
			<span>Верное значение: </span>
			<xsl:apply-templates select="err:SuccessContent"/>
		</xsl:if>
		<xsl:if test="err:DocValue">
			<br/>
			<span>Значение из главного документа: </span>
			<xsl:apply-templates select="err:DocValue"/>
		</xsl:if>
		<xsl:if test="err:DocsContent">
			<br/>
			<span>Значение из документов: </span>
			<xsl:apply-templates select="err:DocsContent"/>
		</xsl:if>
		<xsl:if test="err:CompareResult">
			<br/>
			<span>Результат сравнения документов: </span>
			<xsl:choose>
				<xsl:when test="err:CompareResult = 0">полное совпадние</xsl:when>
				<xsl:when test="err:CompareResult = 1">не совпадение</xsl:when>
				<xsl:when test="err:CompareResult = 2">частичное совпадение</xsl:when>
				<xsl:when test="err:CompareResult = 3">не совпадение допустимо</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="err:CompareResult"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="err:CheckNormativeDocument">
			<br/>
			<span>Нормативный документ: </span>
			<xsl:apply-templates select="err:CheckNormativeDocument"/>
		</xsl:if>
		<xsl:if test="err:CorrectValue">
			<br/>
			<span>Верное (ожидаемое) значение: </span>
			<xsl:apply-templates select="err:CorrectValue"/>
		</xsl:if>
		<xsl:if test="err:CodeOrder">
			<br/>
			<span>Код нормативного документа: </span>
			<xsl:apply-templates select="err:CodeOrder"/>
		</xsl:if>
		<xsl:if test="err:ErrDescription">
			<br/>
			<span>Подробное описание ошибки: </span>
			<xsl:apply-templates select="err:ErrDescription"/>
		</xsl:if>
		<xsl:if test="err:CriterionGroup">
			<br/>
			<span>Группа критериев: </span>
			<xsl:apply-templates select="err:CriterionGroup"/>
		</xsl:if>
		<xsl:if test="err:CriterionNum">
			<br/>
			<span>Код критерия: </span>
			<xsl:apply-templates select="err:CriterionNum"/>
		</xsl:if>
		<xsl:if test="err:Stage">
			<br/>
			<span>Этапы контроля, к которым относится ошибка: </span>
			<xsl:for-each select="err:Stage">
				<xsl:if test="position()!=1">; </xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="err:TechID">
			<br/>
			<span>Технические идентификаторы: </span>
			<xsl:for-each select="err:TechID">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="err:DocsContent">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:text>; </xsl:text>"
	</xsl:template>
	<xsl:template match="err:Document">
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="err:CheckNormativeDocument">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates mode="russian_date" select="."/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
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
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,3,1)=':' and substring($dateIn,6,1)=':'">
				<xsl:value-of select="substring($dateIn, 1, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='ErrorList']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
