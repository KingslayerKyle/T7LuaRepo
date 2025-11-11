require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyList_ClanBox" )

local PostLoadFunc = function ( self )
	local l, t, r, b = self:getLocalRect()
	local baseWidth = r - l
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( self, state )
		if state == "Hidden" then
			self:setWidth( 0 )
		else
			self:setWidth( baseWidth )
		end
	end )
end

CoD.PartyList_ClanContainer = InheritFrom( LUI.UIElement )
CoD.PartyList_ClanContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PartyList_ClanContainer )
	self.id = "PartyList_ClanContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 60 )
	self:setTopBottom( 0, 0, 0, 27 )
	
	local PartyListClanBox0 = CoD.PartyList_ClanBox.new( menu, controller )
	PartyListClanBox0:setLeftRight( 0, 1, 2, 0 )
	PartyListClanBox0:setTopBottom( 0, 1, 2, -2 )
	self:addElement( PartyListClanBox0 )
	self.PartyListClanBox0 = PartyListClanBox0
	
	local LblClan = LUI.UITightText.new()
	LblClan:setLeftRight( 0.5, 0.5, -22.5, 22.5 )
	LblClan:setTopBottom( 1, 1, -24, 0 )
	LblClan:setTTF( "fonts/escom.ttf" )
	LblClan:linkToElementModel( self, "clanAbbrev", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LblClan:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LblClan )
	self.LblClan = LblClan
	
	self.resetProperties = function ()
		LblClan:completeAnimation()
		PartyListClanBox0:completeAnimation()
		LblClan:setAlpha( 1 )
		PartyListClanBox0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				PartyListClanBox0:completeAnimation()
				self.PartyListClanBox0:setAlpha( 0 )
				self.clipFinished( PartyListClanBox0, {} )
				LblClan:completeAnimation()
				self.LblClan:setAlpha( 0 )
				self.clipFinished( LblClan, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PartyListClanBox0:close()
		self.LblClan:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

