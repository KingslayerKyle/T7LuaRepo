require( "ui.uieditor.widgets.HUD.CP_PartyList.PartyList_ClanBox" )

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
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 18 )
	
	local PartyListClanBox0 = CoD.PartyList_ClanBox.new( menu, controller )
	PartyListClanBox0:setLeftRight( true, true, 1, 0 )
	PartyListClanBox0:setTopBottom( true, true, 1, -1 )
	self:addElement( PartyListClanBox0 )
	self.PartyListClanBox0 = PartyListClanBox0
	
	local LblClan = LUI.UITightText.new()
	LblClan:setLeftRight( false, false, -15, 15 )
	LblClan:setTopBottom( false, true, -16.16, -0.16 )
	LblClan:setTTF( "fonts/escom.ttf" )
	LblClan:linkToElementModel( self, "clanAbbrev", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LblClan:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( LblClan )
	self.LblClan = LblClan
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PartyListClanBox0:completeAnimation()
				self.PartyListClanBox0:setAlpha( 1 )
				self.clipFinished( PartyListClanBox0, {} )
				LblClan:completeAnimation()
				self.LblClan:setAlpha( 1 )
				self.clipFinished( LblClan, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PartyListClanBox0:completeAnimation()
				self.PartyListClanBox0:setAlpha( 1 )
				self.clipFinished( PartyListClanBox0, {} )
				LblClan:completeAnimation()
				self.LblClan:setAlpha( 1 )
				self.clipFinished( LblClan, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
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

