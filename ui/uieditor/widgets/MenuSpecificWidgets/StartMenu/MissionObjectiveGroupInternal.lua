-- f17257751934204b8e20c245cd986b2f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.MissionObjectiveItem" )
require( "ui.uieditor.widgets.Border" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.getHeightInList = function ( f2_arg0 )
		f2_arg0.objectivesList:processEvent( {
			name = "child_size_updated"
		} )
		local f2_local0, f2_local1, f2_local2, f2_local3 = f2_arg0:getLocalRect()
		local f2_local4, f2_local5, f2_local6, f2_local7 = f2_arg0.objectivesList:getLocalRect()
		f2_arg0:setTopBottom( true, false, f2_local1, f2_local1 + f2_local7 + 5 )
		return f2_local7 + 5
	end
	
	f1_arg0.objectivesList:processEvent( {
		name = "child_size_updated"
	} )
end

CoD.MissionObjectiveGroupInternal = InheritFrom( LUI.UIElement )
CoD.MissionObjectiveGroupInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionObjectiveGroupInternal )
	self.id = "MissionObjectiveGroupInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 260 )
	self:setTopBottom( true, false, 0, 270 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local groupHeaderBackground = LUI.UIImage.new()
	groupHeaderBackground:setLeftRight( true, true, 0, 0 )
	groupHeaderBackground:setTopBottom( true, false, 0, 30 )
	groupHeaderBackground:setRGB( 0.73, 0.74, 0.75 )
	self:addElement( groupHeaderBackground )
	self.groupHeaderBackground = groupHeaderBackground
	
	local groupHeaderText = LUI.UIText.new()
	groupHeaderText:setLeftRight( true, true, 5, -5 )
	groupHeaderText:setTopBottom( true, false, 5, 25 )
	groupHeaderText:setTTF( "fonts/default.ttf" )
	groupHeaderText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	groupHeaderText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( groupHeaderText )
	self.groupHeaderText = groupHeaderText
	
	local objectivesList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	objectivesList:makeFocusable()
	objectivesList:setLeftRight( true, false, 5, 255 )
	objectivesList:setTopBottom( true, false, 35, 267 )
	objectivesList:setDataSource( "ObjectivesList" )
	objectivesList:setWidgetType( CoD.MissionObjectiveItem )
	objectivesList:setVerticalCount( 2 )
	self:addElement( objectivesList )
	self.objectivesList = objectivesList
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 0.73, 0.74, 0.75 )
	self:addElement( border )
	self.border = border
	
	self.groupHeaderText:linkToElementModel( self, "category", true, function ( model )
		local category = Engine.GetModelValue( model )
		if category then
			groupHeaderText:setText( Engine.Localize( category ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 1, 1, 1 )
				self.clipFinished( background, {} )

				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 1, 1, 1 )
				self.clipFinished( background, {} )

				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
			end
		},
		Done = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 0.84, 0.84, 0.84 )
				self.clipFinished( background, {} )

				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )
			end
		}
	}
	objectivesList.id = "objectivesList"

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.objectivesList:close()
		element.border:close()
		element.groupHeaderText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

