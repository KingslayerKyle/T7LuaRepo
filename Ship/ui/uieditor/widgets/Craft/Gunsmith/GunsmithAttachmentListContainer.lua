-- 00009041fa016cf91457d5cdc7a58bf6
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 319 )
	self:setTopBottom( true, false, 0, 38 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local attachmentList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	attachmentList:makeFocusable()
	attachmentList:setLeftRight( true, false, 9, 313 )
	attachmentList:setTopBottom( true, false, 3, 35 )
	attachmentList:setWidgetType( CoD.WeaponVariantIcon )
	attachmentList:setHorizontalCount( 9 )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				attachmentList:completeAnimation()
				self.attachmentList:setAlpha( 1 )
				self.clipFinished( attachmentList, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				attachmentList:completeAnimation()
				self.attachmentList:setAlpha( 0 )
				self.clipFinished( attachmentList, {} )
			end
		}
	}
	attachmentList.id = "attachmentList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.attachmentList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.attachmentList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
