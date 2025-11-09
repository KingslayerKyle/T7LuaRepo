require( "ui.uieditor.widgets.MenuSpecificWidgets.StartMenu.MissionObjectiveStep" )

local PostLoadFunc = function ( self, controller )
	self.getHeightInList = function ( self, controller )
		local statusModel = self:getModel( controller, "status" )
		if statusModel and Engine.GetModelValue( statusModel ) == "done" then
			local text_left, text_top, text_right, text_bottom = self.objectiveName:getLocalRect()
			self:setTopBottom( true, false, 0, text_bottom )
			return text_bottom
		else
			self.subobjectivesList:processEvent( {
				name = "child_size_updated"
			} )
			local list_left, text_top, text_right, text_bottom = self.subobjectivesList:getLocalRect()
			self:setTopBottom( true, false, 0, text_bottom )
			return text_bottom
		end
	end
	
	self.subobjectivesList:processEvent( {
		name = "child_size_updated"
	} )
end

CoD.MissionObjectiveItemInternal = InheritFrom( LUI.UIElement )
CoD.MissionObjectiveItemInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionObjectiveItemInternal )
	self.id = "MissionObjectiveItemInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 115 )
	self.anyChildUsesUpdateState = true
	
	local objectiveName = LUI.UIText.new()
	objectiveName:setLeftRight( true, true, 0, 0 )
	objectiveName:setTopBottom( true, false, 0, 25 )
	objectiveName:setRGB( 0.57, 0.58, 0.59 )
	objectiveName:setTTF( "fonts/default.ttf" )
	objectiveName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	objectiveName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( objectiveName )
	self.objectiveName = objectiveName
	
	local subobjectivesList = LUI.GridLayout.new( menu, controller, false, 0, 0, 0, 0, nil, nil, false, false, 0, 0, false, true )
	subobjectivesList:setLeftRight( true, false, 2.5, 247.5 )
	subobjectivesList:setTopBottom( true, false, 25, 115 )
	subobjectivesList:setRGB( 1, 1, 1 )
	subobjectivesList:setWidgetType( CoD.MissionObjectiveStep )
	subobjectivesList:setVerticalCount( 3 )
	subobjectivesList:setSpacing( 0 )
	self:addElement( subobjectivesList )
	self.subobjectivesList = subobjectivesList
	
	self.objectiveName:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			objectiveName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				objectiveName:completeAnimation()
				self.objectiveName:setRGB( 0.57, 0.58, 0.59 )
				self.clipFinished( objectiveName, {} )
				subobjectivesList:completeAnimation()
				self.subobjectivesList:setAlpha( 1 )
				self.clipFinished( subobjectivesList, {} )
			end
		},
		Done = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				objectiveName:completeAnimation()
				self.objectiveName:setRGB( 0.73, 0.74, 0.75 )
				self.clipFinished( objectiveName, {} )
				subobjectivesList:completeAnimation()
				self.subobjectivesList:setAlpha( 0 )
				self.clipFinished( subobjectivesList, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				objectiveName:completeAnimation()
				self.objectiveName:setRGB( 0.57, 0.58, 0.59 )
				self.clipFinished( objectiveName, {} )
				subobjectivesList:completeAnimation()
				self.subobjectivesList:setAlpha( 1 )
				self.clipFinished( subobjectivesList, {} )
			end
		}
	}
	self.close = function ( self )
		self.subobjectivesList:close()
		self.objectiveName:close()
		CoD.MissionObjectiveItemInternal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

