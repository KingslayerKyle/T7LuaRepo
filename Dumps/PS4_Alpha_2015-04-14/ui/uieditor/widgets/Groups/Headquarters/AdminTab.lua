require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left_wHeader" )

CoD.AdminTab = InheritFrom( LUI.UIElement )
CoD.AdminTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AdminTab )
	self.id = "AdminTab"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 461 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ButtonList = LUI.UIList.new( menu, controller, 3, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 11, 367 )
	ButtonList:setTopBottom( true, false, 11, 428 )
	ButtonList:setRGB( 1, 1, 1 )
	ButtonList:setDataSource( "GroupHeadquartersAdminButtonList" )
	ButtonList:setWidgetType( CoD.List1ButtonLarge_Left_wHeader )
	ButtonList:setVerticalCount( 12 )
	ButtonList:setSpacing( 3 )
	ButtonList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NonMemberView = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ButtonList:completeAnimation()
				self.ButtonList:setAlpha( 1 )
				self.clipFinished( ButtonList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NonMemberView",
			condition = function ( menu, element, event )
				return IsNotAGroupMember( element, controller )
			end
		}
	} )
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.ButtonList:close()
		CoD.AdminTab.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

