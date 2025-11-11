require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponVariantIcon" )

CoD.freeCursorWeaponAttachments = InheritFrom( LUI.UIElement )
CoD.freeCursorWeaponAttachments.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorWeaponAttachments )
	self.id = "freeCursorWeaponAttachments"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 100 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackBG2 = LUI.UIImage.new()
	BlackBG2:setLeftRight( 0, 1, 0, 0 )
	BlackBG2:setTopBottom( 0, 1, 0, 0 )
	BlackBG2:setRGB( 0.05, 0.15, 0.11 )
	BlackBG2:setAlpha( 0.98 )
	self:addElement( BlackBG2 )
	self.BlackBG2 = BlackBG2
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0.03, 0.98, 0, 0 )
	backing:setTopBottom( 0, 1, 0, 0 )
	backing:setRGB( 0.05, 0.15, 0.11 )
	backing:setAlpha( 0 )
	self:addElement( backing )
	self.backing = backing
	
	local attachmentList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	attachmentList:makeFocusable()
	attachmentList:setLeftRight( 0, 0, 22, 320 )
	attachmentList:setTopBottom( 0, 0, 36, 84 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 6 )
	attachmentList:linkToElementModel( self, "attachmentDataSource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachmentList:setDataSource( modelValue )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( attachmentList, "setDataSource", function ( element, dataSource )
		if not ListElementHasDataSource( self, "attachmentList" ) then
			SetState( self, "Hidden" )
		elseif not ListElementHasElements( self, "attachmentList" ) then
			SetState( self, "Hidden" )
		else
			SetState( self, "DefaultState" )
		end
	end )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local description = LUI.UITightText.new()
	description:setLeftRight( 0, 0, 22, 181 )
	description:setTopBottom( 0, 0, 4, 31 )
	description:setAlpha( 0.7 )
	description:setText( Engine.Localize( "MENU_CURRENT_ATTACHMENTS" ) )
	description:setTTF( "fonts/default.ttf" )
	self:addElement( description )
	self.description = description
	
	self.resetProperties = function ()
		description:completeAnimation()
		attachmentList:completeAnimation()
		BlackBG2:completeAnimation()
		description:setAlpha( 0.7 )
		attachmentList:setAlpha( 1 )
		BlackBG2:setAlpha( 0.98 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				description:completeAnimation()
				self.description:setAlpha( 1 )
				self.clipFinished( description, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BlackBG2:completeAnimation()
				self.BlackBG2:setAlpha( 0 )
				self.clipFinished( BlackBG2, {} )
				attachmentList:completeAnimation()
				self.attachmentList:setAlpha( 0 )
				self.clipFinished( attachmentList, {} )
				description:completeAnimation()
				self.description:setAlpha( 0 )
				self.clipFinished( description, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Hidden" )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "DefaultState" ) then
			ExpandFreeCursorElement( self )
		else
			CollapseFreeCursorElement( self )
		end
	end )
	attachmentList.id = "attachmentList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.attachmentList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.attachmentList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

