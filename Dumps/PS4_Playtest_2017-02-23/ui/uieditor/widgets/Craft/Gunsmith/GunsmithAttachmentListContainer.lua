require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponVariantIcon" )

CoD.GunsmithAttachmentListContainer = InheritFrom( LUI.UIElement )
CoD.GunsmithAttachmentListContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithAttachmentListContainer )
	self.id = "GunsmithAttachmentListContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 478 )
	self:setTopBottom( 0, 0, 0, 57 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local attachmentList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	attachmentList:makeFocusable()
	attachmentList:setLeftRight( 0, 0, 18, 466 )
	attachmentList:setTopBottom( 0, 0, 4, 52 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 9 )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	self.resetProperties = function ()
		attachmentList:completeAnimation()
		attachmentList:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hide = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				attachmentList:completeAnimation()
				self.attachmentList:setAlpha( 0 )
				self.clipFinished( attachmentList, {} )
			end
		}
	}
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

